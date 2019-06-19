class DarkskyService
  def initialize(location)
    @lat = location['center'][1]
    @lng = location['center'][0]
  end

  def hourly
    get_json[:hourly][:data]
  end

  private

  def conn
    Faraday.new('https://api.darksky.net/forecast/') do |f|
      f.params[:exclude] = 'currently,minutely,daily,alerts,flags'
      f.adapter Faraday.default_adapter
    end
  end

  def get_json
    response = conn.get("#{ENV['DARK_SKY_API']}/#{@lat},#{@lng}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
