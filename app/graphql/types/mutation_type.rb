module Types
  class MutationType < Types::BaseObject
    field :create_user_store, mutation: Mutations::CreateUserStore
    field :create_user_store_item, mutation: Mutations::CreateUserStoreItem
  end
end
