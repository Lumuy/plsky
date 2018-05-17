FactoryBot.define do
  factory :user, class: Registration::User do
    phone_number '13166668888'
    password     'password'
    signature    'rspec factory_bot test'
    password_confirmation 'password'
    sequence(:name) { |n| "user name #{n}" }
    sequence(:email) { |n| "email#{n}@test.com" }
  end
end
