require 'faraday'
require 'json'

class KrogerService

  def self.auth_conn
    auth = Base64.strict_encode64("#{ENV['kroger_client_id']}:#{ENV['kroger_client_secret']}")
    Faraday.new(
      url: 'https://api.kroger.com',
      headers: {
        'Authorization': "Basic #{auth}",
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json'
      },
      params: {
        'filter.radiusInMiles': '10',
        'filter.limit': '10'
      }
    )
  end

  def self.authorize
    response = auth_conn.post('/v1/connect/oauth2/token') do |faraday|
      faraday.params['grant_type'] = 'client_credentials'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_kroger_stores(zipcode)
    response = auth_conn.get("/v1/locations?filter.zipCode.near=#{zipcode}") do |faraday|
      faraday.headers['Authorization'] = "Bearer #{authorize[:access_token]}"
      faraday.params['filter.zipCode.near'] = zipcode
    end
    parse(response)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
