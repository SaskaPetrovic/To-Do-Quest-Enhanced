class AchievementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @achievements = current_user.achievements.includes(:sub_category)
    @user = current_user
  end

  def create
    @achievement = Achievement.new(achievement_params)
    @achievement.user = current_user

    if @achievement.save
      redirect_to achievements_path, notice: "Achievement created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def achievement_params
    params.require(:achievement).permit(:title, :description, :sub_category_id)
  end
end
