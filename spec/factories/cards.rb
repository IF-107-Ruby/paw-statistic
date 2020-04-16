FactoryBot.define do
  factory :card do
    github_id { Faker::Number.number(digits: 6) }
    column {  create(:column) }
    note { Faker::Lorem.sentence }
    user { create(:user) }
  end
end
