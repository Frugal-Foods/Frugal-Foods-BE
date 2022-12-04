class AddQuantityToUserStoreItems < ActiveRecord::Migration[5.2]
  def change
    add_column :user_store_items, :quantity, :integer
  end
end
