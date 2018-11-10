class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user, class_name: 'User'
  has_many :comments, -> { order('created_at') }, dependent: :destroy
end
