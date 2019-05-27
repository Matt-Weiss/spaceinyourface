class MapboxService
  def initialize(location)
    @location = location
  end

  def returned_locations
    get_json(format_location)
  end

private

  def conn
    Faraday.new("https://api.mapbox.com/geocoding/v5/mapbox.places") do |f|
      f.params[:access_token] = ENV['MAPBOX_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    url.concat('.json')
    response = conn.get(url)
    JSON.parse(response.body)
  end

  def format_location
    @location.downcase.gsub(' ', '%20')
  end
end
