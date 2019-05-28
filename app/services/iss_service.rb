class IssService
  def initialize(mapbox_long_lat)
    @latitude = mapbox_long_lat.last.to_s
    @longitude = mapbox_long_lat.first.to_s
  end

  def conn
    Faraday.new("https://api.satellites.calum.org/rest/v1/25544/next-pass") do |f|
      f.params['lat'] = @latitude
      f.params['lon'] = @longitude
      f.params['alt'] = 0
      f.adapter Faraday.default_adapter
    end
  end

  def get_json
    response = conn.get
    JSON.parse(response.body)
  end
end
