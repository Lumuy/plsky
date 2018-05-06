class Registration::User < ApplicationRecord
  attr_accessor :password_confirmation

  before_save :encrpt_password

  validates :phone_number, presence: true, uniqueness: true
  validates :password, presence: true
  validates :phone_number, format: { with: /\A\d{11}\z/i }
  validates_confirmation_of :password

  def self.authenticate(phone_number, password)
    user = find_by_phone_number(phone_number)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrpt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
