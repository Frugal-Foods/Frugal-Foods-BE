class DropUserItems < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_items
  end
end
