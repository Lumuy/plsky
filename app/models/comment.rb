class Comment < ApplicationRecord
  validates :body, presence: true,
                   allow_blank: true

  belongs_to :post
  belongs_to :registration_user, class_name: 'Registration::User'
end
