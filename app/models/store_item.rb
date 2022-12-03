class StoreItem < ApplicationRecord
  belongs_to :store
  belongs_to :item
  validates_presence_of :price

  def item_name
    Item.find_by(id: self.item_id).name
  end
end
