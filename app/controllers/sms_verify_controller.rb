class SmsVerifyController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :verify

  def verify
    @sv = SmsVerification.new(sms_verification_params)
    if @sv.save
      @sv.send_sms_verification
    else
    end
  end

  private

  def sms_verification_params
    params.require(:sms_verification).permit(:phone_number)
  end

end
