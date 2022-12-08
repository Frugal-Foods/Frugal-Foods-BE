class Mutations::DestroyUserStore < Mutations::BaseMutation
    field :id, ID, null: false
    field :errors, [String], null: false
  
    argument :id, ID, required: true

    def resolve(id:)
      user_store = UserStore.find_by(id: id)
      if user_store.present?
        user_store.destroy
      else
      {
        id: "Invalid ID or query parameter. Please try again."
      }
    end
  end
end
