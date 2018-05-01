class Registration::UsersController < ApplicationController
  def new
    @user = Registration::User.new
  end

  def create
    @user = Registration::User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up"
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:registration_user).permit(:phone_number, :password, :password_confirmation)
  end
end
