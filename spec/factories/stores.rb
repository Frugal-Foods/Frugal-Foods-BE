FactoryBot.define do
  factory :store do
    name { ["Target", "Kroger"].sample }
    address { Faker::Address.full_address }
    zipcode { Faker::Address.zip }
  end
end
