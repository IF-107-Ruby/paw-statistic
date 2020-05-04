FactoryBot.define do
  factory :issue do
    card { create(:card) }
    title { Faker::Lorem.sentence }
    team_member { create(:team_member) }
    state { Faker::Lorem.word }
    html_url { Faker::Internet.url }
    locked { false }
    number { Faker::Number.unique.number(digits: 2) }
  end

  trait :with_assignee do
    after(:build) do |issue|
      issue.assignee = create(:team_member)
    end
  end
end
