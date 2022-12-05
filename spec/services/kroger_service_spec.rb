require 'rails_helper'

RSpec.describe KrogerService do
  it 'gets an authorization token before making the zipcode call', :vcr do
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
end
