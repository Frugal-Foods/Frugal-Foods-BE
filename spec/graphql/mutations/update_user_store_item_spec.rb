require 'rails_helper'
module Mutations
  module UserStores
    RSpec.describe DestroyUserStoreItem, type: :request do
      before :each do
        user = create(:user)
        store = create(:store)
        item = create(:item)
        store_item = StoreItem.create!(store: store, item: item, price: "1.55")
        @user_store_item = UserStoreItem.create!(user: user, store_item: store_item, quantity: 3)

        @query = <<~GQL
        mutation{
          updateUserStoreItem(input:{
            id: "#{@user_store_item.id}",
            quantity: 9
              }) {
                id
                quantity
            }
          }
        GQL
        


        # @bad_query = <<~GQL
        # mutation{
        #   destroyUserStoreItem(input:{
        #     id: "8"
        #   }) {
        #     id
        #   }
        # }
        # GQL
      end

      describe '.resolve' do
        it 'updates a user store items quantity' do
          expect(@user_store_item.quantity).to eq(UserStoreItem.last.quantity)
          expect(UserStoreItem.last.quantity).to eq(3)
          
          post '/graphql', params: { query: @query}
          json = JSON.parse(response.body)
          data = json["data"]["updateUserStoreItem"]

          expect(data["quantity"]).to eq(UserStoreItem.last.quantity)
          expect(data["quantity"]).to eq(9)
        end

        it 'returns the user store item id and updated quantity' do
          post '/graphql', params: { query: @query}
          json = JSON.parse(response.body)
          data = json["data"]["updateUserStoreItem"]

          expect(data["id"].to_i).to eq(@user_store_item.id)
          expect(data["quantity"]).to_not eq(@user_store_item.quantity)
          expect(data["quantity"]).to be_a(Integer)
        end
    

        xit 'returns an error message if user store item parameters are invalid' do
          post '/graphql', params: { query: @bad_query}
          json = JSON.parse(response.body)
      

        end
      end
    end
  end
end