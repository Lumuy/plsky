module Registration
  class User < ApplicationRecord
    has_many :posts,      dependent: :destroy
    has_many :comments,   dependent: :destroy

    attr_accessor :password_confirmation

    before_save :encrpt_password

    USER_NAME_FORMAT           = 'A-Za-z0-9\-\_\.'
    USER_NAME_FORMAT_REGEXP    = /\A[#{USER_NAME_FORMAT}]*\z/
    PHONE_NUMBER_REGEXP        = /\A[1-9]\d{10}\z/
    EMAIL_REGEXP               = /\A[a-z\d\-\_\.]+@[a-z\.]+\.[a-z]+\z/i

    validates :password,     presence: true
    validates :phone_number, presence: true,
                             uniqueness: true,
                             format: { with: PHONE_NUMBER_REGEXP }
    validates :email,        allow_nil: true, 
                             format: { with: EMAIL_REGEXP, on: :create }
    validates_confirmation_of :password

    mount_uploader :avatar, AvatarUploader


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
end
