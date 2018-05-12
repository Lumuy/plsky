module Registration
  class SessionsController < ApplicationController
    def new
    end

    def create
      user = Registration::User.authenticate(params[:phone_number], params[:password])
      if user
        session[:registration_user_id] = user.id
        redirect_to root_url, :notice => "Logged in"
      else
        flash[:warning] = "无效的号码或错误密码"
        render "new"
      end
    end

    def destroy
      session[:registration_user_id] = nil
      redirect_to root_url, :notice => "Logged out"
    end

    private

    def user_params
      params.require(:registration_user).permit(:phone_number, :password, :password_salt)
    end
  end
end
