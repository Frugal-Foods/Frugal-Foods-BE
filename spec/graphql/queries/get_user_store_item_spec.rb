require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'Get UserStoreItems' do
    before :each do
      @user = User.create(email: Faker::Internet.email)

      store1 = @user.stores.create(name: Faker::Commerce.vendor, address: Faker::Address.full_address, zipcode: '12345')
      store2 = @user.stores.create(name: Faker::Commerce.vendor, address: Faker::Address.full_address, zipcode: '12345')
      store3 = @user.stores.create(name: Faker::Commerce.vendor, address: Faker::Address.full_address, zipcode: '12345')
      store4 = Store.create(name: Faker::Commerce.vendor, address: Faker::Address.full_address, zipcode: '12345')

      item1 = Item.create(name: Faker::Food.ingredient, photo_url: Faker::Internet.url)
      item2 = Item.create(name: Faker::Food.ingredient, photo_url: Faker::Internet.url)
      item3 = Item.create(name: Faker::Food.ingredient, photo_url: Faker::Internet.url)

      storeitem1 = StoreItem.create(store_id: store1.id, item_id: item1.id, price: Faker::Commerce.price(range: 0..10.0))
      storeitem2 = StoreItem.create(store_id: store2.id, item_id: item1.id, price: Faker::Commerce.price(range: 0..10.0))
      storeitem3 = StoreItem.create(store_id: store3.id, item_id: item1.id, price: Faker::Commerce.price(range: 0..10.0))
      storeitem4 = StoreItem.create(store_id: store2.id, item_id: item2.id, price: Faker::Commerce.price(range: 0..10.0))
      storeitem5 = StoreItem.create(store_id: store3.id, item_id: item3.id, price: Faker::Commerce.price(range: 0..10.0))

      UserStoreItem.create(user_id: @user.id, store_item_id: storeitem1.id, quantity: 2)
      UserStoreItem.create(user_id: @user.id, store_item_id: storeitem4.id, quantity: 5)
      UserStoreItem.create(user_id: @user.id, store_item_id: storeitem2.id, quantity: 1)

      @result = JSON.parse(FrugalFoodsBeSchema.execute(query).to_json, symbolize_names: true)
    end

    it 'can return all UserStoreItems, organized by store' do
      expect(@result).to be_a Hash
      expect(@result[:data][:userStoreItems]).to be_an Array
      expect(@result[:data][:userStoreItems].count).to eq(3)

      user_stores = @result[:data][:userStoreItems]

      user_stores.each do |store|
        expect(store).to have_key :storeId
        expect(store).to have_key :name
        expect(store).to have_key :address
        expect(store).to have_key :storeTotalPrice
        expect(store).to have_key :listItems
        expect(store[:storeId]).to be_an Integer
        expect(store[:name]).to be_a String
        expect(store[:address]).to be_a String
        expect(store[:storeTotalPrice]).to be_a Float
        expect(store[:listItems]).to be_an Array

        user_store_items = store[:listItems]

        user_store_items&.each do |item|
          expect(item).to have_key :id
          expect(item).to have_key :itemName
          expect(item).to have_key :itemPhotoUrl
          expect(item).to have_key :price
          expect(item).to have_key :quantity
          expect(item).to have_key :itemTotal
          expect(item[:id]).to be_a String
          expect(item[:itemName]).to be_a String
          expect(item[:itemPhotoUrl]).to be_a String
          expect(item[:price]).to be_a Float
          expect(item[:quantity]).to be_an Integer
          expect(item[:itemTotal]).to be_a Float
        end
      end
    end

    def query
      <<~GQL
      {
        userStoreItems(userId: #{@user.id}) {
          storeId
          name
          address
          storeTotalPrice
          listItems {
                id
                itemName
                itemPhotoUrl
                price
                quantity
                itemTotal
              }
         }
    }
      GQL
    end
  end
end
