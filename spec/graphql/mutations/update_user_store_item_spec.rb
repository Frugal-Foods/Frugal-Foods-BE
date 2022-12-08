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
        xit 'updates a user store item' do
          expect(@user_store_item.quantity).to eq(3)

          post '/graphql', params: { query: @query}
   
          expect(@user_store_item.quantity).to eq(4)
        end

        xit 'returns a list of user store items after update' do
          post '/graphql', params: { query: @query}
          json = JSON.parse(response.body)

        end
    

        xit 'returns an error message if user store item parameters are invalid' do
          post '/graphql', params: { query: @bad_query}
          json = JSON.parse(response.body)
      

        end
      end
    end
  end
end