FactoryBot.define do
  factory :pull_request do
    github_id { Faker::Number.number(digits: 6) }
    html_url { Faker::Internet.url }
    number { Faker::Number.number(digits: 2) }
    state { Faker::Lorem.word }
    title { Faker::Lorem.sentence }
    locked { false }
    user { create(:user) }
    body { Faker::Lorem.sentence }
  end
end
