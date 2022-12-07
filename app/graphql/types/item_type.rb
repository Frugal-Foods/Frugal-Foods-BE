module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :photo_url, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :stores, [Types::StoreType], null: false
    field :store_items, [Types::StoreItemType], null: false
    field :store_name, String, null: false
    field :item_name, String, null: false
    field :price, Float, null: false
    field :store_item_id, String, null: false
    field :item_id, String, null: false
    field :store_id, String, null: false
  end
end
