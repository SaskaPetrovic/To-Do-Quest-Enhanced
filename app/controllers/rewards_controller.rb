class RewardsController < ApplicationController
  before_action :authenticate_user!

  def validate
    user = current_user
    xp_reward = params[:xp_reward].to_i
    rewards = params[:rewards] || []
    task = Task.find(params[:task])
    Rails.logger.debug("XP Reward: #{xp_reward}")
    Rails.logger.debug("Rewards: #{rewards.inspect}")

    # Ajouter l'expérience au joueur
    user.add_experience(xp_reward)

    # Mettre à jour les statistiques en fonction des récompenses
    update_user_stats(user, task)


    # Sauvegarder l'utilisateur et gérer la réponse
    if user.save
      render json: {
        success: true,
        level: user.level,
        experience_percentage: user.experience_percentage,
        experience_for_next_level: user.experience_for_next_level
      }
    else
      Rails.logger.debug("User save failed: #{user.errors.full_messages}")
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  def update_user_stats(user, task)
    rewards = category_rewards(task)
    cleaned_reward = ""
    rewards.each do |reward|
      cleaned_reward = reward.gsub(' ', '').strip
    end
      case cleaned_reward
      when /STR/i
        user.str += 1
      when /INT/i
        user.int += 1
      when /MANA/i
        user.mana += 1
      when /DEX/i
        user.dex += 1
      when /CHA/i
        user.cha += 1
      end
      user_stat = {
        "STR" => user.str,
        "INT" => user.int,
        "MANA" => user.mana,
        "DEX" => user.dex,
        "CHA" => user.cha
      }
      user_max = user_stat.max_by {|k,v|v}.first

      case user_max
      when "STR"
        if user.str > 5
          user.roles = "Knight"
        end
      when "INT"
        if user.int > 5
          user.roles = "Rogue"
        end
      when "MANA"
        if user.mana > 5
          user.roles = "Mage"
        end
      when "DEX"
        if user.dex > 5
          user.roles = "Ranger"
        end
      when "CHA"
        if user.cha > 5
          user.roles = "Bard"
        end
      end

    if user.save
      Rails.logger.debug("User stats updated successfully.")
    else
      Rails.logger.debug("User stats update failed: #{user.errors.full_messages}")
    end
  end

  def category_rewards(task)
    sub_category = SubCategory.find(task.first.sub_category_id)
    case sub_category.category.title
    when 'Domestic'
      ['STR']
    when 'Work/School'
      ['INT']
    when 'Leisure & Social'
      ['CHA']
    when 'Health & Wellness'
      ['DEX']
    when 'Personal Growth'
      ['MANA']
    end
  end
end
