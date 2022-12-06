require 'rails_helper'

module Mutations
  module UserStoreItems
    RSpec.describe CreateUserStoreItem, type: :request do
      describe '.resolve' do
        let!(:user) {create(:user)}
        let!(:store) {create(:store)}
        let!(:item) {create(:item)}
        let!(:store_item) {StoreItem.create!(store: store, item: item, price: "1.99")}

        it 'creates a user store item' do
          expect(UserStoreItem.count).to eq(0)

          post '/graphql', params: { query: query(user_id: user.id, store_item_id: store_item.id, quantity: 1)}
          expect(UserStoreItem.count).to eq(1)
        end

        it 'returns a user store item' do
          post '/graphql', params: { query: query(user_id: user.id, store_item_id: store_item.id, quantity: 1)}
          json = JSON.parse(response.body)

          data = json['data']['createUserStoreItem']['userStoreItem']
          expect(data).to include({ "id" => UserStoreItem.last.id.to_s,
                                    "userId" => user.id,
                                    "storeItemId" => store_item.id})
        end
    

        it 'returns an error message if user store parameters are invalid' do
          post '/graphql', params: { query: bad_query(user_id: "1", store_item_id: "1", quantity: "three")}
          json = JSON.parse(response.body)

          messages = json['errors'].first['message']
          expect(json['data']).to eq(nil)
          expect(messages).to include("Argument 'quantity' on InputObject 'CreateUserStoreItemInput' has an invalid value (three)")
        end

        def query(user_id:, store_item_id:, quantity:)
          <<~GQL
          mutation {
            createUserStoreItem(
              input: 
              {userId: #{user_id}, storeItemId: #{store_item_id}, quantity: #{quantity}}) {
              userStoreItem {
                id
                userId
                storeItemId
                quantity
              }
              errors
            }
          }
          GQL
        end

        def bad_query(user_id:, store_item_id:, quantity:)
          <<~GQL
          mutation {
            createUserStoreItem(
              input: 
              {userId: #{user_id}, storeItemId: #{store_item_id}, quantity: #{quantity}}) {
              userStoreItem {
                id
                userId
                storeItemId
                quantity
              }
              errors
            }
          }
          GQL
        end
      end
    end
  end
end
