class Store < ApplicationRecord
  has_many :store_items
  has_many :user_stores
  has_many :items, through: :store_items
  has_many :users, through: :user_stores
  validates_presence_of :address, :name, :zipcode
end
