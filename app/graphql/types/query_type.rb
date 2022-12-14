module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    field :user, [Types::UserType], null: false
    field :stores, [Types::StoreType], null: true do
      argument :zipcode, String, required: true
    end
    field :store_items, [Types::StoreItemType], null: true
    field :item_name, [Types::StoreItemType], null: true do
      argument :store_item, String, required: true
    end
    field :user_store_items, [Types::UserStoreType], null: true do
      argument :user_id, ID, required: true
    end

    def user
      [User.all.last]
    end

    def stores(zipcode:)
      Store.where(zipcode: zipcode)
    end

    def user_store_items(user_id:)
      UserStore.where(user_id: user_id)
    end

    def item_name(store_item)
      store_item.item_name
    end

    field :items, [Types::ItemType], null: true do
      argument :search, String, required: true
      argument :user_id, Integer, required: true
    end

    def items(search:, user_id:)
      Item.search_items(search, user_id)
    end

    field :user_stores, [Types::ItemType], null: true do
      argument :user_id, Integer, required: true
    end

    def user_stores(user_id:)
      UserStore.where(user_id: user_id)
    end
  end
end