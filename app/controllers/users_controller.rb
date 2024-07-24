class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update]

  def update
    if current_user.update(user_params)
      redirect_to dashboard_path, notice: 'Profile was successfully updated.'
    else
      render 'dashboard/index'
    end
  end

  def achievements
    @user = User.find(params[:id])
    @achievements = @user.achievements
  end
  
  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :experience, :level)
  end

end
