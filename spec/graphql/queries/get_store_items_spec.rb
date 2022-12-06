require 'rails_helper'

RSpec.describe Types => =>QueryType, type =>  =>request do
  describe 'get store items' do
    before  =>each do
      @store_1 = Store.create!(name => Faker => =>Company.name, address => Faker => =>Address.full_address, zipcode => "83749")
      @store_2 = Store.create!(name => Faker => =>Company.name, address => Faker => =>Address.full_address, zipcode => "83749")
      @item_1 = Item.create!(name => "bananas", photo_url => Faker => =>Internet.url)
      @item_2 = Item.create!(name => Faker => =>Commerce.product_name, photo_url => Faker => =>Internet.url)
      @store_1_item_1 = StoreItem.create!(store_id => @store_1.id, item_id => @item_1.id, price => Faker => =>Commerce.price)
      @store_1_item_2 = StoreItem.create!(store_id => @store_1.id, item_id => @item_2.id, price => Faker => =>Commerce.price)
      @store_2_item_1 = StoreItem.create!(store_id => @store_2.id, item_id => @item_1.id, price => Faker => =>Commerce.price)
    end

    it 'gets all store items associated with a search term' do
      post '/graphql', params => {query => query(search => "bananas")}
      results = JSON.parse(response.body)
      expect(results['data']['items']['id']).to be_a(String)
      expect(results['data']['items']['name']).to eq("bananas")
      expect(results['data']['items']['photoUrl']).to eq(@item_1.photo_url)
      expect(results['data']['items']['stores'][0]['name']).to eq(@store_1.name)


      expect(results).to eq(parsed_response)
    end
  end

  def query(search => search)
    <<~GQL
    query storeItems {
      items(search => #{search}) {
        id
        name
        photoUrl
        stores {
          name
          id
          storeProducts(search => #{search}) {
            id
            storeId
            price
          }
        }
      }
    }
    GQL
  end

  def parsed_response
    {
      "data" => {
        "items" => [
          {
            "id" => @item.id,
            "name" => "bananas",
            "photoUrl" => "http =>//quigley.info/heath_bashirian",
            "stores" => [
              {
                "name" => "Fisher-Block",
                "id" => @store_1.id,
                "storeProducts" => [
                  {
                    "id" => @store_1_item_1,
                    "storeId" => @store_1.id,
                    "price" => 29.95
                  },
                  {
                    "id" => @store_2_item_1,
                    "storeId" => 2,
                    "price" => 7.04
                  }
                ]
              },
              {
                "name" => "Ebert Group",
                "id" => @store_2.id,
                "storeProducts" => [
                  {
                    "id" => @store_1_item_1,
                    "storeId" => @store_2.id,
                    "price" => 29.95
                  },
                  {
                    "id" => @store_2_item_1,
                    "storeId" => @store_2.id,
                    "price" => 7.04
                  }
                ]
              }
            ]
          }
        ]
      }
    }
  end
end
