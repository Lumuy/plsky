class Registration::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :imgverify
  
  def new
    @user = Registration::User.new
  end

  def create
    @user = Registration::User.new(user_params)
    if verify_rucaptcha? @user, keep_session: true && @user.save
      redirect_to root_url, :notice => "注册成功"
    else
      flash[:notice] = "注册失败"
      render "new"
    end
  end

  def imgverify
    if verify_rucaptcha? keep_session: true
      render json: nil, status: :ok
    else
      head :bad_request
    end
  end

  private

  def user_params
    params.require(:registration_user).permit(:phone_number,
                                              :password,
                                              :password_confirmation)
  end
end
