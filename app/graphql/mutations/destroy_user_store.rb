class Mutations::DestroyUserStore < Mutations::BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :id, ID, null: false

    # TODO: define arguments
    # argument :name, String, required: true
    argument :id, ID, required: true
    #argument :user_id, ID, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    def resolve(id:)
      us = UserStore.find(id)
      us.destroy
    end

end
