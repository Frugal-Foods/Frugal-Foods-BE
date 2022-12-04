class Mutations::CreateUserStore < Mutations::BaseMutation
  argument :store_id, Integer, required: true
  argument :user_id, Integer, required: true

  field :user_store, Types::UserStoreType, null: false
  field :errors, [String], null: false
  
  def resolve(store_id:, user_id:)
    user_store = UserStore.new(store_id: store_id, user_id: user_id)

    if user_store.save
      {
        user_store: user_store,
        errors: []
      }
    else
      {
        user: nil,
        errors: user.errors.full_messages
      }
    end
  end
end