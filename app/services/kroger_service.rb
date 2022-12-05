require 'faraday'
require 'json'

class KrogerService

  def self.get_kroger_stores(zipcode)
    response = auth_conn.get('/v1/locations') do |faraday|
      faraday.headers['Authorization'] = "Bearer #{authorize[:access_token]}"
      faraday.params['filter.zipCode.near'] = zipcode
      faraday.params['filter.radiusInMiles'] = '10'
      faraday.params['filter.limit'] = '10'
    end
    parse(response)
  end

  def self.get_items(store_id:, search_term:)
    response = auth_conn.get('/v1/products') do |faraday|
      faraday.headers['Authorization'] = "Bearer #{authorize_products[:access_token]}"
      faraday.params['filter.term'] = search_term
      faraday.params['filter.locationId'] = store_id
    end
    parse(response)
  end

  private

  def self.auth_conn
    auth = Base64.strict_encode64("#{ENV['kroger_client_id']}:#{ENV['kroger_client_secret']}")
    Faraday.new(
      url: 'https://api.kroger.com',
      headers: {
        'Authorization': "Basic #{auth}",
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json'
      }
    )
  end

  def self.authorize
    response = auth_conn.post('/v1/connect/oauth2/token') do |faraday|
      faraday.params['grant_type'] = 'client_credentials'
    end
    parse(response)
  end

  def self.authorize_products
    response = auth_conn.post('/v1/connect/oauth2/token') do |faraday|
      faraday.params['grant_type'] = 'client_credentials'
      faraday.params['scope'] = 'product.compact'
    end
    parse(response)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
