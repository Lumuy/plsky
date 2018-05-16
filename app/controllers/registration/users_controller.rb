module Registration
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :imgverify

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if phno_eql(@user) && @user.save
        flash[:success] = "注册成功"
        redirect_to root_url
      else
        flash[:info] = "注册失败"
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

    def phno_eql user
      phnos = SmsVerification.order(created_at: :desc)
                             .where("phone_number = ?", user.phone_number)
      if phnos.size
        phnos.first.verification_code == params[:vcode]
      else
        false
      end
    end

    def user_params
      params.require(:registration_user).permit(:phone_number,
                                                :password,
                                                :password_confirmation)
    end
  end

end
