# frozen_string_literal: true

module Types
  class StoreItemType < Types::BaseObject
    field :id, ID, null: false
    field :store_id, Integer
    field :item_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :price, Float
  end
end
