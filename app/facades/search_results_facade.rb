class SearchResultsFacade
  attr_reader :location,
              :bodies
  def initialize(search_params)
    @location = search_params['location']
    @bodies = search_params['bodies']
  end
end
