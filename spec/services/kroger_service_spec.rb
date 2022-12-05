require 'rails_helper'

RSpec.describe KrogerService do
  it 'can get an authorization token before making a call', :vcr do
    auth_token = KrogerService.authorize
    expect(auth_token).to be_an(Object)
  end

  it 'returns Kroger grocery stores near a given zipcode', :vcr do
    zipcode = '80108'
    search = KrogerService.get_kroger_stores(zipcode)

    expect(search).to be_a Hash
    expect(search[:data]).to be_an Array

    kroger_stores = search[:data]

    kroger_stores.each do |store|
      expect(store).to have_key :locationId
      expect(store).to have_key :address
      expect(store[:address]).to have_key :addressLine1
      expect(store[:address]).to have_key :city
      expect(store[:address]).to have_key :state
      expect(store[:address]).to have_key :zipCode
      expect(store[:address][:addressLine1]).to be_a String
      expect(store[:address][:city]).to be_a String
      expect(store[:address][:state]).to be_a String
      expect(store[:address][:zipCode]).to be_a String
      expect(store).to have_key :name
    end
  end

  it 'can return grocery items from a specific store from a search', :vcr do
    zipcode = '80108'
    response = KrogerService.get_kroger_stores(zipcode)
    store_id = response[:data][2][:locationId]
    search_term = 'banana'

    search = KrogerService.get_items(store_id: store_id, search_term: search_term)

    expect(search).to be_a Hash
    expect(search[:data]).to be_an Array

    items = search[:data]

    items.each do |item|
      expect(item).to have_key :description
      expect(item[:description]).to be_a String
      expect(item).to have_key :images
      expect(item[:images]).to be_an Array
      expect(item[:images][0][:sizes][3][:url]).to be_a String
      expect(item).to have_key :items
      expect(item[:items]).to be_an Array
      expect(items[0][:price][:regular]).to be_a Float
      expect(items[0][:price][:promo]).to be_a Float
      expect(items[0]).to have_key :size
      expect(items[0][:size]).to be_a String
    end
  end
end
