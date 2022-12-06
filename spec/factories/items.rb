FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    photo_url { Faker::Internet.url }
  end
end
