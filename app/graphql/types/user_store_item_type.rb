# frozen_string_literal: true

module Types
  class UserStoreItemType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :store_item_id, Integer
    field :quantity, Integer
    field :stores, [Types::StoreType]
    field :grand_total_price, Float
    field :store_items, [Types::StoreItemType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def grand_total_price
      123.45
    end

    def stores
      UserStoreItem.select('stores.*').joins(store_item: :store)
    end
  end
end
