# frozen_string_literal: true

module Types
  class UserStoreItemType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :store_item_id, Integer
    field :quantity, Integer
    field :store, String
    field :name, String
    field :price, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def name
      store_item = StoreItem.find(object.store_item_id)
      Item.find(store_item.item_id).name
    end

    def price
      StoreItem.find(object.store_item_id).price
    end
  end
end
