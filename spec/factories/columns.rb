FactoryBot.define do
  factory :column do
    project { create(:project) }
    name { Faker::Lorem.sentence }
  end
end
