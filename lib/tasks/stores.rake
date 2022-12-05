require 'csv'

namespace :json_load do
  
  desc "Read JSON File of Stores"
  task stores: :environment do
    kroger_stores_80108 = JSON.parse(File.read('kroger_80108.json'), symbolize_names: true)
    kroger_stores_80206 = JSON.parse(File.read('kroger_80206.json'), symbolize_names: true)


  def full_address(store)
    "#{store[:addressLine1]}, #{store[:city]}, #{store[:state]}, #{store[:zipcode]}"
  end

  kroger_80108[:data].each do |kroger_store|
    Store.create!(name: kroger_store[:name],
                  address: full_address(kroger_store[:address]),
                  zipcode: kroger_store[:zipcode])
  end

  kroger_80206[:data].each do |kroger_store|
    Store.create!(name: kroger_store[:name],
                  address: full_address(kroger_store[:address]),
                  zipcode: kroger_store[:zipcode])
  end

    ActiveRecord::Base.connection.reset_pk_sequence!('stores')
  end
end