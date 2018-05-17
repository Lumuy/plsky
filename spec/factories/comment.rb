FactoryBot.define do
  factory :comment do
    body 'comment body'
    association :post
    association :user
  end
end
