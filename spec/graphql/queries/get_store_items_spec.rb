require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  describe 'get store items' do
    before  :each do
      @user = create(:user)
      @store_1 = create(:store, zipcode: "83749")
      @store_2 = create(:store, zipcode: "83749")
      @item_1 = create(:item, name: "bananas")
      @item_2 = create(:item)
      @user_store_1 = UserStore.create!(user_id: @user.id, store_id: @store_1.id)
      @store_1_item_1 = create(:store_item, store_id: @store_1.id, item_id: @item_1.id)
      @store_1_item_2 = create(:store_item, store_id: @store_1.id, item_id: @item_2.id)
      @store_2_item_1 = create(:store_item, store_id: @store_2.id, item_id: @item_1.id)
    end

    it 'gets all store items associated with a search term' do
      post '/graphql', params: {query: query}
      results = JSON.parse(response.body, symbolize_names: true)


      expect(results).to be_a(Hash)

      results[:data][:items].each do |item|
        expect(item).to have_key(:itemName)
        expect(item).to have_key(:itemId)
        expect(item).to have_key(:photoUrl)
        expect(item).to have_key(:price)
        expect(item).to have_key(:storeItemId)
        expect(item).to have_key(:storeId)
        expect(item[:itemName]).to be_a(String)
        expect(item[:itemId]).to be_a(String)
        expect(item[:photoUrl]).to be_a(String)
        expect(item[:price]).to be_a(Float)
        expect(item[:storeItemId]).to be_a(String)
        expect(item[:storeId]).to be_a(String)
      end
      items = results[:data][:items].first

      expect(items[:itemName]).to eq('bananas')
      expect(items[:itemId]).to eq(@item_1.id.to_s)
      expect(items[:photoUrl]).to eq(@item_1.photo_url)
      expect(items[:storeName]).to eq(@store_1.name)
      expect(items[:price]).to eq(@store_1_item_1.price)
      expect(items[:storeItemId]).to eq(@store_1_item_1.id.to_s)
      expect(items[:storeId]).to eq(@store_1.id.to_s)
    end
  
    def query
      <<~GQL
      query storeItems {
        items(search: "banan", userId: #{@user.id}) {
            userId
            itemName
            itemId
            photoUrl
            storeName
            price
            storeItemId
            storeId
        }
      }
      GQL
    end
  end
end