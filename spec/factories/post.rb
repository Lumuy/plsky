FactoryBot.define do
  factory :post do
    title 'post title'
    content 'post content'
    association :user
  end
end
