# frozen_string_literal: true

module Types
  class UserStoreItemType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :store_item_id, Integer
    field :quantity, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
