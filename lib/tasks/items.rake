namespace :json_load do
  desc "Read JSON File of Items"
    task items: :environment do
      target_items = JSON.parse(File.read('./db/data/items/target_items.json'), symbolize_names: true)
      # This file currently contains the 279 items (Pages 1 - 10)
      kroger_items1 = JSON.parse(File.read('./db/data/items/1-80108_king_soopers.json'), symbolize_names: true)
      kroger_items2 = JSON.parse(File.read('./db/data/items/2-80108_king_soopers.json'), symbolize_names: true)
      kroger_items3 = JSON.parse(File.read('./db/data/items/3-80108_king_soopers.json'), symbolize_names: true)
      kroger_items4 = JSON.parse(File.read('./db/data/items/1-80206_king_soopers.json'), symbolize_names: true)
      kroger_items5 = JSON.parse(File.read('./db/data/items/2-80206_king_soopers.json'), symbolize_names: true)
      kroger_items6 = JSON.parse(File.read('./db/data/items/3-80206_king_soopers.json'), symbolize_names: true)
      # Kroger files each currently contain 50 items (from search: produce, snack, dairy, frozen, deli)

      def self.target_stores
        Store.where(name: 'Target')
      end

      def self.seed_target_items(item_data_file:)
        item_data_file[:category_results].each do |item|
          Item.create!(name: item[:product][:title], photo_url: item[:product][:main_image])
          target_stores.each do |store|
            StoreItem.create!(item_id: Item.last.id, store_id: store.id, price: item[:offers][:primary][:price])
          end
        end
      end

      def self.seed_kroger_items(item_data_file:, store_id:)
        item_data_file[:data].each do |item|
          existing_item = Item.find_by(name: item[:description])
          if existing_item
            StoreItem.create!(item_id: existing_item.id, store_id: store_id, price: item[:items][0][:price][:regular])
          else
            Item.create!(name: item[:description], photo_url: item[:images][0][:sizes][3][:url])
            StoreItem.create!(item_id: Item.last.id, store_id: store_id, price: item[:items][0][:price][:regular])
          end
        end
      end

      seed_target_items(item_data_file: target_items)
      seed_kroger_items(item_data_file: kroger_items1, store_id: 1)
      seed_kroger_items(item_data_file: kroger_items2, store_id: 2)
      seed_kroger_items(item_data_file: kroger_items3, store_id: 3)
      seed_kroger_items(item_data_file: kroger_items4, store_id: 4)
      seed_kroger_items(item_data_file: kroger_items5, store_id: 5)
      seed_kroger_items(item_data_file: kroger_items6, store_id: 6)

      ActiveRecord::Base.connection.reset_pk_sequence!('items')
    end
end
