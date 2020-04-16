FactoryBot.define do
  factory :column do
    github_id { Faker::Number.number(digits: 6) }
    project { create(:project) }
    name { Faker::Lorem.sentence }
  end
end
