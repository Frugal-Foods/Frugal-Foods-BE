require 'faraday'
require 'json'

class TargetService
  def self.get_grocery_items(search_term)
    response = conn.get("/request?search_term=#{search_term}")
    parse(response)
  end

  private 
  
  def self.conn
    Faraday.new('https://api.redcircleapi.com') do |faraday|
      faraday.params['type'] = 'search'
      faraday.params['category_id'] = '5xt1a'
      faraday.params['api_key'] = ENV['target_api_key']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
