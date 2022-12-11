require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  describe 'get user stores' do
    before :each do
      @user = create(:user)
      @store_1 = create(:store, zipcode: "83749")
      @store_2 = create(:store, zipcode: "83749")
      @item_1 = create(:item, name: "bananas")
      @item_2 = create(:item)
      @user_store = UserStore.create!(user_id: @user.id, store_id: @store_1.id)
      @store_1_item_1 = create(:store_item, store_id: @store_1.id, item_id: @item_1.id)
      @store_1_item_2 = create(:store_item, store_id: @store_1.id, item_id: @item_2.id)
      @store_2_item_1 = create(:store_item, store_id: @store_2.id, item_id: @item_1.id)
    end

    it 'gets all user stores' do
      post '/graphql', params: {query: query}
      results = JSON.parse(response.body, symbolize_names: true)

      expect(results[:data][:userStores].first[:id]).to eq(@user_store.id.to_s)
      expect(results[:data][:userStores].first[:storeId]).to eq(@store_1.id.to_s)
      expect(results[:data][:userStores].first[:userId]).to eq(@user.id)
    end

    it 'gives an error response if no user id is given' do
      post '/graphql', params: {query: bad_query}
      results = JSON.parse(response.body, symbolize_names: true)

      expect(results[:errors].first[:message]).to eq("Argument 'userId' on Field 'userStores' has an invalid value (\"\"). Expected type 'Int!'.")
    end

    def query
      <<~GQL
      query {
        userStores(userId: #{@user.id}) {
          id
          storeId
          userId
        }
      }
      GQL
    end

    def bad_query
      <<~GQL
      query {
        userStores(userId: "") {
          id
          storeId
          userId
        }
      }
      GQL
    end
  end
end