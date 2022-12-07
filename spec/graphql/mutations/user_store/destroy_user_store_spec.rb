require 'rails_helper'
module Mutations
  module UserStores
    RSpec.describe DestroyUserStore, type: :request do

      describe '.resolve' do
        let!(:user) {create(:user)}
        let!(:store) {create(:store)}
        #let!(:user_store) {create(:user_store)}
        #x = UserStore.create!(user: user store: store)

        it 'destroys a user store' do
          #expect(UserStore.count).to eq(0)
          #binding.pry
          x = UserStore.create!(user: user, store: store)
          #post '/graphql', params: { query: query(user_id: user.id, store_id: store.id)}
          binding.pry
          expect(UserStore.count).to eq(1)


        end

        xit 'returns a user store' do
          post '/graphql', params: { query: query(user_id: user.id, store_id: store.id)}
          json = JSON.parse(response.body)
          data = json['data']['createUserStore']['userStore']
          expect(data).to include({ "id" => UserStore.last.id.to_s,
                                    "userId" => user.id,
                                    "storeId" => store.id})
        end
    

        xit 'returns an error message if user store parameters are invalid' do
          post '/graphql', params: { query: bad_query(user_id: "", store_id: "")}
          json = JSON.parse(response.body)

          messages = json['errors'].first['message']
          expect(json['data']).to eq(nil)
          expect(messages).to include("Parse error")
            
        end

        def query(id:)
          <<~GQL
            mutation {
              destroyUserStore(
                input: 
                {Id: #{id}}) {
                userStore {
                  id

                }
                errors
              }
            }
          GQL
        end

        def bad_query(user_id:, store_id:)
          <<~GQL
            mutation {
              createUserStore(
                input: {userId: #{user_id}, storeId: #{store_id}}) {
                userStore {
                  id
                  userId
                  storeId
                }
                errors
              }
            }
          GQL
        end
      end
    end
  end
end
