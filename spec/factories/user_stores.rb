FactoryBot.define do
  factory :user_store do
    user { Faker::Number.between(from: 1, to: 50) }
    store {  Faker::Number.between(from: 1, to: 50) }
  end
end
