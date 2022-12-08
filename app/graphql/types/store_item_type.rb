module Types
  class StoreItemType < Types::BaseObject
    field :id, ID, null: false
    field :store_id, Integer, null: false
    field :item_id, Integer, null: false
    field :price, Float, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
