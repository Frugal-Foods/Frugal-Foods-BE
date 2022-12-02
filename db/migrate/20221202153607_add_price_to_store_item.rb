class AddPriceToStoreItem < ActiveRecord::Migration[5.2]
  def change
    add_column :store_items, :price, :float
  end
end
