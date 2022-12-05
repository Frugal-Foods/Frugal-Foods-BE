require 'csv'

namespace :json_load do
  
  desc "Read JSON File of Stores"
  task stores: :environment do
    kroger_stores_80108 = JSON.parse(File.read('./db/data/kroger_80108.json'), symbolize_names: true)
    kroger_stores_80206 = JSON.parse(File.read('./db/data/kroger_80206.json'), symbolize_names: true)


  def full_address(store)
    "#{store[:addressLine1]}, #{store[:city]}, #{store[:state]}, #{store[:zipCode]}"
  end

  kroger_stores_80108[:data].each do |kroger_store|
    Store.create!(name: kroger_store[:name],
                  address: full_address(kroger_store[:address]),
                  zipcode: "80108") #This zip code is not the store's zipcode. It is the zipcode of the search. 
  end

  kroger_stores_80206[:data].each do |kroger_store|
    Store.create!(name: kroger_store[:name],
                  address: full_address(kroger_store[:address]),
                  zipcode: "80206") #This zip code is not the store's zipcode. It is the zipcode of the search. 
  end

    ActiveRecord::Base.connection.reset_pk_sequence!('stores')
  end
end