class IssSearchResultFacade
  def initialize(iss_search_params)
    @raw_location = iss_search_params['location']
  end

  def user_estimated_location
    mapbox_best_guess["place_name"]
  end

  def time_of_search
    Time.now.to_s
  end

  def next_rise_time
    Time.parse(iss_data['start']).localtime
  end

  def duration
    seconds = Time.parse(iss_data['end']).localtime - next_rise_time
    minutes = (seconds.to_f / 60).round(2)
  end

  private

    def iss_data
      @_iss_data ||= iss_service.get_json
    end

    def iss_service
      @_iss_service ||= IssService.new(mapbox_long_lat)
    end

    def location
      @_location ||= MapboxService.new(@raw_location)
    end

    def mapbox_best_guess
      location.returned_locations["features"].first
    end

    def mapbox_long_lat
      mapbox_best_guess["center"]
    end
end
