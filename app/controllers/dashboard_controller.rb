class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @tasks = current_user.tasks
    @achievements = current_user.achievements
    @random_memo = Memo.order('RANDOM()').first
    @ongoing_quests_count = @user.tasks.where(status: 'in_progress').count

  end
end
