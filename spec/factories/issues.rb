FactoryBot.define do
  factory :issue do
    github_id { Faker::Number.number(digits: 6) }
    title { Faker::Lorem.sentence }
    user { create(:user) }
    state { Faker::Lorem.word }
    locked { false }
    number { Faker::Number.unique.number(digits: 2) }
  end
end
