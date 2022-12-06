require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display UserStoreItems' do
    before :each do
      @user = User.create(email: Faker::Internet.email)

      store1 = @user.stores.create(name: Faker::Commerce.vendor, address: Faker::Address.full_address)
      store2 = @user.stores.create(name: Faker::Commerce.vendor, address: Faker::Address.full_address)
      store3 = @user.stores.create(name: Faker::Commerce.vendor, address: Faker::Address.full_address)

      item1 = Item.create(name: Faker::Food.ingredient, photo_url: 'url.com')
      item2 = Item.create(name: Faker::Food.ingredient, photo_url: 'url.com')
      item3 = Item.create(name: Faker::Food.ingredient, photo_url: 'url.com')

      storeitem1 = StoreItem.create(store_id: store1.id, item_id: item1.id, price: Faker::Commerce.price(range: 0..10.0))
      storeitem2 = StoreItem.create(store_id: store2.id, item_id: item1.id, price: Faker::Commerce.price(range: 0..10.0))
      storeitem3 = StoreItem.create(store_id: store3.id, item_id: item1.id, price: Faker::Commerce.price(range: 0..10.0))
      storeitem4 = StoreItem.create(store_id: store2.id, item_id: item2.id, price: Faker::Commerce.price(range: 0..10.0))
      storeitem5 = StoreItem.create(store_id: store3.id, item_id: item3.id, price: Faker::Commerce.price(range: 0..10.0))

      UserStoreItem.create(user_id: @user.id, store_item_id: storeitem1.id)
      UserStoreItem.create(user_id: @user.id, store_item_id: storeitem4.id)

      post '/graphql', params: { query: query }
      json = JSON.parse(response.body, symbolize_names: true)
      binding.pry
      data = json['data']['userStoreItems']

      @result = FrugalFoodsBeSchema.execute(query).as_json
    end

    it 'can query all UserStoreItems' do
      expect(response).to be_successful
      expect(response[:data]).to be_a Hash
      expect(@result['data']['userStoreItems'].count).to eq(2)
    end

    def query
      <<~GQL
      {
        userStoreItems(userId: #{@user.id}) {
          stores {
            id
            name
            address
            storeItems {
              id
              price
              itemName
              photoUrl
              quantity
              itemTotal
            }
          storeTotalPrice
          }
        grandTotalPrice
        }
      }
      GQL
    end
  end
end
