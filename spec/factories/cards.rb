FactoryBot.define do
  factory :card do
    column { create(:column) }
    note { Faker::Lorem.sentence }
    team_member { create(:team_member) }
  end
end
