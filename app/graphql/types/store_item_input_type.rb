module Types
  class StoreItemInputType < Types::BaseInputObject
    argument :store_id, Integer, required: false
    argument :item_id, Integer, required: false
    argument :price, Float, required: false

    
  end
end