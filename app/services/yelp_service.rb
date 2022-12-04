require 'faraday'
require 'json'

class YelpService
  def self.get_target_stores(zipcode)
    response = conn.get("/v3/businesses/search?location=#{zipcode}")
    parse(response)
  end

  def self.conn
    Faraday.new('https://api.yelp.com') do |faraday|
      faraday.params['term'] = 'target'
      faraday.params['radius'] = '16093'
      faraday.headers['Authorization'] = ENV['yelp_api_key']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
