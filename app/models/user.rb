class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :achievements

  #validates :username, :roles, presence: true

  validates :email, uniqueness: true

  def stats
    {
      strength: self.str,
      intelligence: self.int,
      mana: self.mana,
      dexterity: self.dex,
      charisma: self.cha
    }
  end

  def memo
    self[:memo] || 'No memo available'
  end

  def status
    self[:status] || 'No status available'
  end

  def experience_percentage
    max_experience = experience_for_next_level
    if max_experience > 0
      [(experience.to_f / max_experience) * 100, 100].min
    else
      0
    end
  end

  def experience_for_next_level
    base_experience = 100
    growth_rate = 0.10

    base_experience * ((1 + growth_rate) ** (level - 1)).to_i
  end

  def experience_to_next_level
    max_experience = experience_for_next_level
    [max_experience - experience, 0].max
  end

  def experience
    super || 0
  end

  def level
    self[:level] || 1
  end


  def update_user_stats(task)
    rewards = task.category_rewards
    rewards.each do |reward|
      stat = reward.sub('+1 ', '')

      case stat
      when 'STR'
        increment!(:str, 1)
      when 'INT'
        increment!(:int, 1)
      when 'MANA'
        increment!(:mana, 1)
      when 'DEX'
        increment!(:dex, 1)
      when 'CHA'
        increment!(:cha, 1)
      end
    end

    assign_role
  end

  ROLES_CRITERIA = {
    'Mage' => { mana: 5 },
    'Rogue' => { int: 5},
    'Ranger' => { dex: 5},
    'Knight' => { str: 5},
    'Bard' => { cha: 5}
  }

  def assign_role
    role = 'None' # Rôle par défaut si aucun critère n'est rempli

    ROLES_CRITERIA.each do |r, criteria|
      if meets_criteria?(criteria)
        role = r
        break
      end
    end

    update(roles: role)
  end

  private

  def meets_criteria?(criteria)
    criteria.all? { |stat, value| send(stat) >= value }
  end
end
