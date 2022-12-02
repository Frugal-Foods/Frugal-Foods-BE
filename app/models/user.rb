class User < ApplicationRecord
  has_many :user_stores
  has_many :user_items
  has_many :stores, through: :user_stores
  has_many :items, through: :user_items
end
