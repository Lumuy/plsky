class SmsVerification < ApplicationRecord
  validates :phone_number, presence: true
  validates :phone_number, format: { with: /\A\d{11}\z/i }
  attr_accessor :verify_code

  before_save :set_verify_code

  def set_verify_code
    if phone_number.present?
      self.verify_code = rand(1..9).to_s + 5.times.map { rand(10) }.join
    end
  end
end
