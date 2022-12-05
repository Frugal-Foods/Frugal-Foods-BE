require 'faraday'
require 'json'

class KrogerService
  def self.get_kroger_stores(zipcode)
    response = conn.get("/locations?filter.zipCode.near=#{zipcode}")
    parse(response)
  end

  def self.conn
    Faraday.new('https://api.kroger.com/v1') do |faraday|
      faraday.params['filter.radiusInMiles'] = '10'
      faraday.params['filter.limit'] = '10'
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
