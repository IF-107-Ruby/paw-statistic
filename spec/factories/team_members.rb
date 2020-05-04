FactoryBot.define do
  factory :team_member do
    login { Faker::Internet.username }

    trait :with_assignment do
      after(:build) do |team_member|
        create(:issue, assignee: team_member)
      end
    end
  end
end
