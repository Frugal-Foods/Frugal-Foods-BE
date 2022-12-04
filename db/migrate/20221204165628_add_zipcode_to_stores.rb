class AddZipcodeToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :zipcode, :string
  end
end
