class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :registration_user, class_name: 'Registration::User'
  has_many :comments, -> { order('created_at') }, dependent: :destroy
end
