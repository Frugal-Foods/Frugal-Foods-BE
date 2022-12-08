require 'rails_helper'
module Mutations
  module UserStores
    RSpec.describe DestroyUserStoreItem, type: :request do
      before :each do
        user = create(:user)
        store = create(:store)
        item = create(:item)
        store_item = StoreItem.create!(store: store, item: item, price: "$1.55")
        @user_store_item = UserStoreItem.create!(user: user, store_item: store_item, quantity: 3)
        
        @query = <<~GQL
        mutation{
          destroyUserStoreItem(input:{
            id: "#{@user_store_item.id}"
          }) {
            id
          }
        }
        GQL

        @bad_query = <<~GQL
        mutation{
          destroyUserStoreItem(input:{
            id: "8"
          }) {
            id
          }
        }
        GQL
      end

      describe '.resolve' do
        it 'destroys a user store' do
          expect(UserStoreItem.count).to eq(1)

          post '/graphql', params: { query: @query}
   
          expect(UserStoreItem.count).to eq(0)
        end

        it 'returns a user store id after deletion' do
          post '/graphql', params: { query: @query}
          json = JSON.parse(response.body)
          id = json["data"]["destroyUserStoreItem"]["id"]
          
          expect(id).to eq(@user_store_item.id.to_s)
        end
    

        it 'returns an error message if user store parameters are invalid' do
          post '/graphql', params: { query: @bad_query}
          json = JSON.parse(response.body)
      
          message = json["data"]["destroyUserStoreItem"]["id"]
          expect(message).to eq("Invalid ID or query parameter. Please try again.")
        end
      end
    end
  end
end