FactoryBot.define do
  factory :store_item do
    store { Faker::Number.between(from: 1, to: 50) }
    item { Faker::Number.between(from: 1, to: 50) }
  end
end
