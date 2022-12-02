class StoreItem < ApplicationRecord
  belongs_to :store
  belongs_to :item
  validates_presence_of :price
end
