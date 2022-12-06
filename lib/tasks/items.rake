namespace :json_load do
  desc "Read JSON File of Items"
    task items: :environment do
    target_items = JSON.parse(File.read('./db/data/items/target_items.json'), symbolize_names: true)
    # This file contains the first 279 items (Pages 1 - 10)

    # def self.target_stores
    #   Store.where(name: 'Target')
    # end

    # target_items[:category_results].each do |item|
    #   Item.create!(name: item[:product][:title], photo_url: item[:product][:main_image])
    #   target_stores.each do |store|
    #     StoreItem.create!(item_id: Item.last.id, store_id: store.id, price: item[:offers][:primary][:price])
    #   end
    # end

    kroger_items_1 = JSON.parse(File.read('./db/data/items/1-80108_king_soopers.json'), symbolize_names: true)
    # 2_80108_kroger_items = JSON.parse(File.read('./db/data/items/2-80108_king_soopers.json'), symbolize_names: true)
    # 3_80108_kroger_items = JSON.parse(File.read('./db/data/items/3-80108_king_soopers.json'), symbolize_names: true)
    # 4_80206_kroger_items = JSON.parse(File.read('./db/data/items/1-80206_king_soopers.json'), symbolize_names: true)
    # 5_80206_kroger_items = JSON.parse(File.read('./db/data/items/2-80206_king_soopers.json'), symbolize_names: true)
    # 6_80206_kroger_items = JSON.parse(File.read('./db/data/items/3-80206_king_soopers.json'), symbolize_names: true)

    kroger_items_1[:data].each do |item|
      existing_item = Item.find_by(name: item[:description])
      if existing_item
        StoreItem.create!(item_id: existing_item.id, store_id: 1, price: item[:items][0][:price][:regular])
      else
        Item.create!(name: item[:description], photo_url: item[:images][0][:sizes][3][:url])
        StoreItem.create!(item_id: Item.last.id, store_id: 1, price: item[:items][0][:price][:regular])
      end
    end

    ActiveRecord::Base.connection.reset_pk_sequence!('items')
    end
end
