FactoryBot.define do
  factory :user do
    github_id { Faker::Number.number(digits: 6) }
    login { Faker::Internet.username }

    trait :with_assignie do
      after(:build) do |user|
        create(:issue, assignee: user)
      end
    end
  end
end
