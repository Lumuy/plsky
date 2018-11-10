module Registration
  class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.authenticate(params[:phone_number], params[:password])
      if user
        session[:user_id] = user.id
        flash[:success] = '登陆成功'
        redirect_to root_url
      else
        flash[:warning] = "无效的号码或错误密码"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      flash[:light] = '成功注销'
      redirect_to root_url
    end

    private

    def user_params
      params.require(:user_id).permit(:phone_number, :password, :password_salt)
    end
  end
end
