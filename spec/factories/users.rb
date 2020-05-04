FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    sequence(:password) { |n| "password#{n}" }
    sequence(:password_confirmation) { |n| "password#{n}" }
  end
end
