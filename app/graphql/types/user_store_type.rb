module Types
  class UserStoreType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :store_id, Integer, null: false
    field :name, String
    field :address, String
    field :store_total_price, Float
    field :list_items, [Types::UserStoreItemType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def store_total_price
      object.total_price(object.store_id)
    end

    def list_items
      object.user_store_items_by_store(object.store_id)
    end
  end
end
