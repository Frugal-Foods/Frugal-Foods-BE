module Types
  class StoreItemType < Types::BaseObject
    field :id, ID, null: false
    field :store_id, Integer, null: false
    field :item_id, Integer, null: false
    field :item_name, String
    field :photo_url, String
    field :quantity, Integer
    field :item_total, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :price, Float, null: false

    def item_name
      #joins with item
    end

    def photo_url
      #joins with item
    end

    def quantity
      #joins with UserStoreItem
    end

    def item_total
      quantity * price
    end
  end
end
