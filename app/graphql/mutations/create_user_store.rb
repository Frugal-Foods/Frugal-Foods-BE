class Mutations::CreateUserStore < Mutations::BaseMutation
  argument :store_id, ID, required: true
  argument :user_id, ID, required: true

  field :user_store, Types::UserStoreType, null: false
  field :errors, [String], null: false
  
  def resolve(store_id:, user_id:)
    user_store = UserStore.new(store_id: store_id, user_id: user_id)
    if (UserStore.any? { |user_store| user_store.user_id == user_id.to_i } && UserStore.any? { |user_store| user_store.store_id == store_id.to_i }) 
      {
        user_store: nil,
        errors: []
      }
    elsif user_store.save
      {
        user_store: user_store,
        errors: []
      }  
    else
      {
        user_store: nil,
        errors: user_store.errors.full_messages
      }
    end
  end
end