class User < ApplicationRecord
  has_many :user_stores
  has_many :user_store_items
  has_many :stores, through: :user_stores
  has_many :store_items, through: :user_store_items
  validates_presence_of :email
end
