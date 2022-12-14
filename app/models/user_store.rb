class UserStore < ApplicationRecord
  belongs_to :user
  belongs_to :store

  def name
    Store.find(store_id).name
  end

  def address
    Store.find(store_id).address
  end

  def total_price(object_store_id)
    user_store_items_by_store(object_store_id).sum do |item|
      (item.price * item.quantity)
    end.round(2)
  end

  def user_store_items_by_store(object_store_id)
    UserStoreItem
    .select('user_store_items.id as user_store_item_id', 'user_store_items.quantity', 'store_items.id as store_item_id', 'store_items.price', 'store_items.item_id')
    .joins(:store_item)
    .where('store_items.store_id = ?', object_store_id)
  end
end
