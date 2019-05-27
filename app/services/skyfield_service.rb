class SkyfieldService
  def initialize(coordinates, bodies)
    @coordinates = coordinates
    @bodies = bodies
  end

  def body_data
    response = conn.get
    JSON.parse(response.body)
  end

  private

    def conn
      Faraday.new("https://skyfield-json.herokuapp.com/ephemerides") do |f|
        f.params[:latitude] = latitude
        f.params[:longitude] = longitude
        f.params[:bodies] = body_params
        f.adapter Faraday.default_adapter
      end
    end

    def longitude
      Coordinate.new(@coordinates.first).longitude
    end

    def latitude
      Coordinate.new(@coordinates.last).latitude
    end

    def body_params
      p = ""
      @bodies.each { |body| p.concat("#{body.downcase},") }
      p.chop
    end
end
