require 'rails_helper'
module Mutations
  module UserStores
    RSpec.describe CreateUserStore, type: :request do
      describe '.resolve' do
        let!(:user) {create(:user)}
        let!(:store) {create(:store)}

        it 'creates a user store' do
          expect(UserStore.count).to eq(0)

          post '/graphql', params: { query: query(user_id: user.id, store_id: store.id)}
          expect(UserStore.count).to eq(1)
        end

        it 'returns a user store' do
          post '/graphql', params: { query: query(user_id: user.id, store_id: store.id)}
          json = JSON.parse(response.body)
          data = json['data']['createUserStore']['userStore']
          expect(data).to include({ "id" => UserStore.last.id.to_s,
                                    "userId" => user.id,
                                    "storeId" => store.id})
        end
    

        it 'returns an error message if user store parameters are invalid' do
          post '/graphql', params: { query: bad_query(user_id: "", store_id: "")}
          json = JSON.parse(response.body)

          messages = json['errors'].first['message']
          expect(json['data']).to eq(nil)
          expect(messages).to include("Parse error")
            
        end

        def query(user_id:, store_id:)
          <<~GQL
            mutation {
              createUserStore(
                input: 
                {userId: #{user_id}, storeId: #{store_id}}) {
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
