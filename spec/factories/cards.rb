FactoryBot.define do
  factory :card do
    column { create(:column) }
    note { Faker::Lorem.sentence }
    user { create(:user) }
  end
end
