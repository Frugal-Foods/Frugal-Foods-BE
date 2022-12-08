class Mutations::DestroyUserStoreItem < Mutations::BaseMutation
  field :id, ID, null: false
  
  argument :id, ID, required: true

  def resolve(id:)
    user_store_item = UserStoreItem.find_by(id: id)
    if user_store_item.present?
      user_store_item.destroy
    else
    {
      id: "Invalid ID or query parameter. Please try again."
    }
  end
end
  
end
