class Registration::UsersController < ApplicationController
  def new
    @user = Registration::User.new
  end

  def create
    @user = Registration::User.new(user_params)
    if verify_rucaptcha? @user, keep_session: true && @user.save
      redirect_to root_url, :notice => "注册成功"
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:registration_user).permit(:phone_number, :password, :password_confirmation)
  end
end
