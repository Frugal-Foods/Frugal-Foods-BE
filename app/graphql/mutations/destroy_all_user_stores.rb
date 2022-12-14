class Mutations::DestroyAllUserStores < Mutations::BaseMutation
  field :user_id, String, null: true
  argument :user_id, String, required: true

  def resolve(user_id:)
    user_store = UserStore.where(user_id: user_id)
    user_store_item = UserStoreItem.where(user_id: user_id)
    user_store.destroy_all
    user_store_item.destroy_all
    {
      user_id: []
    }
  end
end