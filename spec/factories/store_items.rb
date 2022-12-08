FactoryBot.define do
  factory :store_item do
    store { Faker::Number.between(from: 1, to: 50) }
    item { Faker::Number.between(from: 1, to: 50) }
    price {Faker::Number.between(from: 1.00, to: 12.99).round(2)}
  end
end
