class Mutations::UpdateUserStoreItem < Mutations::BaseMutation
  field :id, ID, null: false
  field :quantity, Integer, null: false
    
  argument :id, ID, required: true    
  argument :quantity, Integer, required: true

  def resolve(attributes)
    user_store_item = UserStoreItem.find_by(id: attributes[:id])
      user_store_item.update(quantity: attributes[:quantity])
      user_store_item

  end
end