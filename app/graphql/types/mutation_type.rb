module Types
  class MutationType < Types::BaseObject
    field :destroy_user_store, mutation: Mutations::DestroyUserStore
    field :destroy_all_user_stores, mutation: Mutations::DestroyAllUserStores
    field :destroy_user_store_item, mutation: Mutations::DestroyUserStoreItem
    field :create_user_store, mutation: Mutations::CreateUserStore
    field :create_user_store_item, mutation: Mutations::CreateUserStoreItem
    field :update_user_store_item, mutation: Mutations::UpdateUserStoreItem
  end
end
