class SmsVerification < ApplicationRecord
  validates :phone_number, presence: true
  validates :phone_number, format: { with: /\A\d{11}\z/i }

  after_initialize :set_verify_code

  def set_verify_code
    self.verification_code = rand(1..9).to_s + 5.times.map { rand(10) }.join
  end

  def send_sms_verification
    SmsVerificationService.new({
      phnum: phone_number,
      vcode: verification_code
      }).send_sms
  end

end
