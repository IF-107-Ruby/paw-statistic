FactoryBot.define do
  factory :team_member do
    login { Faker::Internet.username }
    # email { Faker::Internet.safe_email }
    # sequence(:password) { |n| "password#{n}" }
    # sequence(:password_confirmation) { |n| "password#{n}" }

    trait :with_assignment do
      after(:build) do |team_member|
        create(:issue, assignee: team_member)
      end
    end
  end
end
