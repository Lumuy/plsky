class SmsVerifyController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :verify

  def verify
    @sv = SmsVerification.new(sms_verification_params)
    if @sv.save
      binding.pry
      send_sms_verification @sv
    else
    end
  end

  private

  def sms_verification_params
    params.require(:sms_verification).permit(:phone_number)
  end

  def send_sms_verification sv
    SmsVerificationService.new({
      phnum: sv.phone_number,
      vcode: sv.verify_code
      }).send_sms
  end
end
