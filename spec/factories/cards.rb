FactoryBot.define do
  factory :card do
    card_id { Faker::Number.number(digits: 6) }
    column {  create(:column) }
    note { Faker::Lorem.sentence }
    creator { create(:user) }
  end
end
