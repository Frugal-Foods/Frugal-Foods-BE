module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    field :users, [Types::UserType], null: false
    field :items, [Types::ItemType], null: true
    field :stores, [Types::StoreType], null: true
    field :storeItems, [Types::StoreItemType], null: true

    def users
      User.all
    end

    def items
      Item.all
    end

    def stores
      Store.all
    end

  end
end
