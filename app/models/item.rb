class Item < ApplicationRecord
  has_many :store_items
  has_many :user_items
  has_many :items, through: :user_items
  has_many :stores, through: :store_items
  validates :name, presence: true

  def self.search_items(search, user_id)
    Item
      .joins(stores: :user_stores)
      .select("
        items.id AS item_id,
        items.name AS item_name,
        items.photo_url,
        stores.name AS store_name,
        store_items.price,
        store_items.id AS store_item_id,
        stores.id AS store_id,
        user_stores.user_id AS user_id")
      .where("items.name ILIKE ?", "%#{search}%")
      .where("user_stores.user_id = ?", "#{user_id}")
  end
end
