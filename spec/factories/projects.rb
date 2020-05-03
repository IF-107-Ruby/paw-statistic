FactoryBot.define do
  factory :project do
    team_member { create(:team_member) }
    name { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence }
    number { Faker::Number.unique.number(digits: 2) }
    state { Faker::Lorem.word }
  end
end
