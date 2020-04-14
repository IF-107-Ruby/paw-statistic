FactoryBot.define do
  factory :user do
    user_id { Faker::Number.number(digits: 6) }
    login { Faker::Internet.username }
  end
end
