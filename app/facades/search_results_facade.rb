class SearchResultsFacade

  def initialize(search_params)
    @raw_location = search_params['location']
    @bodies = search_params['bodies']
  end

  def user_estimated_location
    mapbox_best_guess["place_name"]
  end

  def body_results
    SkyfieldService.new(mapbox_long_lat, @bodies)
  end

  private

  def location
    @_location ||= MapboxService.new(@raw_location)
  end

  def mapbox_long_lat
    mapbox_best_guess["center"]
  end

  def mapbox_best_guess
    location.returned_locations["features"].first
  end
end
