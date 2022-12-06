module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :photo_url, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :stores, [Types::StoreType], null: false
    field :store_items, [Types::StoreItemType], null: false
    field :store_items_info, [Types::ItemType], null: false

    field :store_name, String, null: false
    def store_name
      store_item = StoreItem.find_by(item_id: object.id)
      store_id = store_item.store_id
      store = Store.find(store_id)
      store.name
    end

    field :item_name, String, null: false
    def item_name
      object.name
    end
    # field :store_name, String, null: false
    # def store_name
    #   store_item = StoreItem.find_by(item_id: object.id)
    #   store_id = store_item.store_id
    #   store = Store.find(store_id)
    #   store.name
    # end

    field :price, String, null: false
    def price
      store_item = StoreItem.find_by(item_id: object.id)
      store_item.price
    end

    field :store_item_id, String, null: false
    def store_item_id
      store_item = StoreItem.find_by(item_id: object.id)
      store_item.id
    end

    field :items_by_store, [Types::ItemType], null: false 
  
    def items_by_store
      # store_item = StoreItem.find_by(item_id: object.id)
    
      Item.joins(:store_items).select("*").where('store_items.item_id = ?', object.id)
    end
  end
end
