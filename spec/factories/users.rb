FactoryBot.define do
  factory :user do
    first_name { Faker::Internet.name }
    last_name { Faker::Internet.name }
    email { Faker::Internet.safe_email }
    sequence(:password) { |n| "password#{n}" }
    sequence(:password_confirmation) { |n| "password#{n}" }
  end
end
