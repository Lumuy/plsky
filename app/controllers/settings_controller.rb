class SettingsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def show
  end

  def update
    if @user.update(user_params)
      flash[:success] = '更新资料成功'
    else
      flash[:info] = '更新资料失败'
    end
    redirect_to settings_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:registration_user).permit(:name, :password, :email, :avatar, :signature)
  end

  def authenticate_user!
    render text: 'not authenticated' unless current_user
  end
end
