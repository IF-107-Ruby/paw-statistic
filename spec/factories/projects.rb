FactoryBot.define do
  factory :project do
    project_id { Faker::Number.number(digits: 6) }
    user { create(:user) }
    name { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence }
    number { Faker::Number.unique.number(digits: 2) }
    state { Faker::Lorem.word }
  end
end
