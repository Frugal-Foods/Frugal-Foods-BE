namespace :json_load do
  desc "Read JSON File of Items"
    task items: :environment do
    target_items = JSON.parse(File.read('./db/data/items/target_items.json'), symbolize_names: true)
    # This file only contains the first 28 items (there are 50 pages of data to potentially use)

    def self.target_stores
      Store.where(name: 'Target')
    end

    target_items[:category_results].each do |item|
      Item.create!(name: item[:product][:title], photo_url: item[:product][:main_image])
      target_stores.each do |store|
        StoreItem.create!(item_id: Item.last.id, store_id: store.id, price: item[:offers][:primary][:price])
      end
    end

    ActiveRecord::Base.connection.reset_pk_sequence!('items')
    end
end
