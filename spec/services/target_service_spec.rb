require 'rails_helper'

RSpec.describe TargetService do
  # This API has a 100 call limit
  it 'returns grocery products information with a given a search term', :vcr do
    search_term = 'banana'
    search = TargetService.get_grocery_items(search_term)

    expect(search).to be_a Hash
    expect(search[:search_results]).to be_an Array

    items = search[:search_results]

    items.each do |item|
      expect(item).to have_key :product
      expect(item[:product]).to be_a Hash
      expect(item[:product]).to have_key :title
      expect(item[:product][:title]).to be_a String
      expect(item[:product]).to have_key :main_image
      expect(item[:product][:main_image]).to be_a String
      expect(item).to have_key :offers
      expect(item[:offers]).to have_key :primary
      expect(item[:offers][:primary]).to have_key :price
      expect(item[:offers][:primary][:price]).to be_a Float
    end
  end
end
