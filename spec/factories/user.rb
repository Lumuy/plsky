FactoryBot.define do
  factory :user, class: Registration::User do
    phone_number '13166668888'
    password     '123456'
    name         'test'
    email        'test@test.com'
    signature    'rspec factory_bot test'
  end
end
