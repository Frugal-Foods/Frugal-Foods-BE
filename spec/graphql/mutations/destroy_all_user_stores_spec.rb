require 'rails_helper'
module Mutations
  module UserStores
    RSpec.describe DestroyAllUserStores, type: :request do
      before :each do
        @user = create(:user)
        store1 = create(:store)
        store2 = create(:store)
        item = create(:item)
        store_item1 = StoreItem.create!(store: store1, item: item, price: 99)
        store_item2 = StoreItem.create!(store: store2, item: item, price: 10)
        user_store1 = UserStore.create!(user: @user, store: store1)
        user_store2 = UserStore.create!(user: @user, store: store2)
        user_store_item1 = UserStoreItem.create!(user: @user, store_item: store_item1, quantity: 2)
        user_store_item2 = UserStoreItem.create!(user: @user, store_item: store_item2, quantity: 1)

        @query = <<~GQL
        mutation{
          destroyAllUserStores(input:{
            userId: "#{@user.id}"
          }) {
            userId
          }
        }
        GQL

        @bad_query = <<~GQL
        mutation{
          destroyAllUserStores(input:{
            userId: "8"
          }) {
            userId
          }
        }
        GQL
      end

      describe '.resolve' do
        it 'destroys all user stores associated with a user' do
          expect(UserStore.count).to eq(2)

          post '/graphql', params: { query: @query}

          expect(UserStore.count).to eq(0)
        end

        it 'destroys all user stores items associated with a user' do
          expect(UserStoreItem.count).to eq(2)

          post '/graphql', params: { query: @query}

          expect(UserStoreItem.count).to eq(0)
        end

        it 'returns an empty array after deletion' do
          post '/graphql', params: { query: @query}
          json = JSON.parse(response.body)
          user_id = json["data"]["destroyAllUserStores"]["userId"]
          
          expect(user_id).to eq("[]")
        end
      end
    end
  end
end
