FactoryBot.define do
  factory :user do
    login { Faker::Internet.username }

    trait :with_assignment do
      after(:build) do |user|
        create(:issue, assignee: user)
      end
    end
  end
end
