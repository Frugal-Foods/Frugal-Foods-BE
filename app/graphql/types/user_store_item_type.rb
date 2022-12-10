module Types
  class UserStoreItemType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :store_item_id, Integer
    field :quantity, Integer
    field :store, String
    field :item_name, String
    field :item_photo_url, String
    field :price, Float
    field :item_total, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_store_item_id, Integer

    def item_name
      store_item = StoreItem.find(object.store_item_id)
      Item.find(store_item.item_id).name
    end

    def item_photo_url
      store_item = StoreItem.find(object.store_item_id)
      Item.find(store_item.item_id).photo_url
    end

    def price
      StoreItem.find(object.store_item_id).price
    end

    def item_total
      object.quantity * object.price
    end
  end
end
