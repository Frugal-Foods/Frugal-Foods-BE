class Mutations::CreateUserStoreItem < Mutations::BaseMutation
  argument :store_item_id, Integer, required: true
  argument :user_id, Integer, required: true

  field :user_store_item, Types::UserStoreItemType, null: false
  field :errors, [String], null: false
  
  def resolve(user_id:, store_item_id:)
    user_store_item = UserStoreItem.new(user_id: user_id, store_item_id: store_item_id)

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