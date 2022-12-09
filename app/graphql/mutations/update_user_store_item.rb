class Mutations::UpdateUserStoreItem < Mutations::BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :id, ID, null: false
    #field :store_id, Types::StoreItemType, null: false
    #field :store_name, Types::StoreType, null: false
    field :quantity, Integer, null: false

    

    # # TODO: define arguments
    #argument :name, String, required: true
    argument :id, ID, required: true    
    #argument :store_id, Types::StoreItemInputType, required: false
    #argument :store_name, String#, required: true
    argument :quantity, Integer, required: true

    def resolve(attributes)
      user_store_item = UserStoreItem.find_by(id: attributes[:id])
      
      user_store_item.update(quantity: attributes[:quantity])
      user_store_item
      #user_store_item.store_item.update(store_id: attributes[:store_id])
      #binding.pry
      # {
      # user_store_item: user_store_item
      # store_item: user_store_item.store_item
      # }

    end

  
end