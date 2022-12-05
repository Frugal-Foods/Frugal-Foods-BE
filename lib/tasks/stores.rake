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
                  zipcode: "80108") #We hard coded this for the prototype, change to kroger_store[:address][:zipCode] to get a list NEAR 80108
  end

  kroger_stores_80206[:data].each do |kroger_store|
    Store.create!(name: kroger_store[:name],
                  address: full_address(kroger_store[:address]),
                  zipcode: "80206") #We hard coded this for the prototype, change to kroger_store[:address][:zipCode] to get a list NEAR 80206
  end

    ActiveRecord::Base.connection.reset_pk_sequence!('stores')
  end
end