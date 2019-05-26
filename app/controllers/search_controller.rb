class SearchController < ApplicationController

  def new
  end

  def index
    # render locals: {
    #   facade: SearchResultsFacade.new(search_params)
    # }
  end

  private

  def search_params
    params.permit(:zip_code, bodies:[])
  end

end
