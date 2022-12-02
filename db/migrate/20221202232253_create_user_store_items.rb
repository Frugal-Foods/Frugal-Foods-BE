class CreateUserStoreItems < ActiveRecord::Migration[5.2]
  def change
    create_table :user_store_items do |t|
      t.references :user, foreign_key: true
      t.references :store_item, foreign_key: true
    end
  end
end