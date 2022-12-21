require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  describe 'get current user' do

    it 'gets all user stores' do
      user = create(:user)

      post '/graphql', params: {query: user_query}
      results = JSON.parse(response.body, symbolize_names: true)

      expect(results[:data][:user].first[:id]).to eq(user.id.to_s)
      expect(results[:data][:user].count).to eq(1)
      expect(results[:data][:user].first.keys).to eq([:id])
    end

    it 'gives an error response if no user id is given' do
      post '/graphql', params: {query: user_query}
      results = JSON.parse(response.body, symbolize_names: true)

      expect(results[:data]).to be(nil)
      expect(results[:errors].first[:message]).to eq("Cannot return null for non-nullable field Query.user")
    end

    def user_query
      <<~GQL
      query {
        user {
          id
        }
      }
      GQL
    end
  end
end