module Types
  class StoreType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :address, String, null: false
    field :items, [Types::ItemType], null: true
    field :zipcode, String, null: false
    field :store_items, [Types::StoreItemType], null: true
    field :store_total_price, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def store_total_price
      # UserStoreItems total of item_total 
    end

    def store_items
     # UserStoreItems store_items for a specific store
    end
  end
end
