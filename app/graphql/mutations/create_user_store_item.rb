class Mutations::CreateUserStoreItem < Mutations::BaseMutation
  argument :store_item_id, ID, required: true
  argument :user_id, ID, required: true
  argument :quantity, Integer, required: true

  field :user_store_item, Types::UserStoreItemType, null: false
  field :errors, [String], null: false
  
  def resolve(user_id:, store_item_id:, quantity:)
    user_store_item = UserStoreItem.new(user_id: user_id, store_item_id: store_item_id, quantity: quantity)

    if user_store_item.save
      {
        user_store_item: user_store_item,
        errors: []
      }
    else
      {
        user: nil,
        errors: user_store_item.errors.full_messages
      }
    end
  end
end