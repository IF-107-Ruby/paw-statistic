FactoryBot.define do
  factory :card_move do
    from { create(:column) }
    to { create(:column) }
    user { create(:user) }
    card { create(:card) }
    moved_at { Faker::Date.between(from: 2.weeks.ago, to: Time.zone.today) }
  end
end
