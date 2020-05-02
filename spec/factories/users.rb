FactoryBot.define do
  factory :user do
    login { Faker::Internet.username }
    email { Faker::Internet.safe_email }
    sequence(:password) { |n| "password#{n}" }
    sequence(:password_confirmation) { |n| "password#{n}" }

    trait :with_assignment do
      after(:build) do |user|
        create(:issue, assignee: user)
      end
    end
  end
end
