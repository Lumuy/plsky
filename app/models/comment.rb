class Comment < ApplicationRecord
  validates :body, presence: true,
                   allow_blank: true

  belongs_to :post
  belongs_to :user, class_name: 'User'
end
