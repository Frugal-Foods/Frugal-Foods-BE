module Types
  class MutationType < Types::BaseObject
    field :create_user_store, mutation: Mutations::CreateUserStore
  end
end
