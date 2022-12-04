require 'rails_helper'

RSpec.describe YelpService do
  it 'returns locations of Target stores within a radius of a given zipcode', :vcr do
    zipcode = '80108'
    search = YelpService.get_target_stores(zipcode)

    expect(search).to be_a Hash
    expect(search[:businesses]).to be_an Array

    target_stores = search[:businesses]

    target_stores.each do |store|
      expect(store).to have_key :name
      expect(store[:name]).to be_a String
      expect(store).to have_key :location
      expect(store[:location]).to be_a Hash
      expect(store[:location]).to have_key :display_address
      expect(store[:location][:display_address]).to be_an Array
    end
  end
end
