require 'rails_helper'
module Mutations
  module UserStores
    # RSpec.describe DestroyUserStoreItem, type: :request do
    #   before :each do
    #     user = create(:user)
    #     store = create(:store)
    #     @user_store = UserStore.create!(user: user, store: store)
        
    #     @query = <<~GQL
    #     mutation{
    #       destroyUserStore(input:{
    #         id: "#{@user_store.id}"
    #       }) {
    #         id
    #       }
    #     }
    #     GQL

    #     @bad_query = <<~GQL
    #     mutation{
    #       destroyUserStore(input:{
    #         id: "8"
    #       }) {
    #         id
    #       }
    #     }
    #     GQL
    #   end

    #   describe '.resolve' do
    #     it 'destroys a user store' do
    #       expect(UserStore.count).to eq(1)

    #       post '/graphql', params: { query: @query}
   
    #       expect(UserStore.count).to eq(0)
    #     end

    #     it 'returns a user store id after deletion' do
    #       post '/graphql', params: { query: @query}
    #       json = JSON.parse(response.body)
    #       id = json["data"]["destroyUserStore"]["id"]
          
    #       expect(id).to eq(@user_store.id.to_s)
    #     end
    

    #     it 'returns an error message if user store parameters are invalid' do
    #       post '/graphql', params: { query: @bad_query}
    #       json = JSON.parse(response.body)
      
    #       message = json["data"]["destroyUserStore"]["id"]
    #       expect(message).to eq("Invalid ID or query parameter. Please try again.")
    #     end
    #   end
    # end
  end
end