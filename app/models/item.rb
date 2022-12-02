class Item < ApplicationRecord
  has_many :store_items
  has_many :user_items
  has_many :items, through: :user_items
  has_many :stores, through: :store_items
  validates :name, presence: true
end
