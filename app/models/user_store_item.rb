class UserStoreItem < ApplicationRecord
  belongs_to :user
  belongs_to :store_item
  validates :quantity, numericality: { greater_than: 0 }
  validates :quantity, presence: true
end
