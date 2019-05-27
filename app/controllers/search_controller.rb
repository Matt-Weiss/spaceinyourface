class SearchController < ApplicationController

  def new
  end

  def index
    @facade = SearchResultsFacade.new(search_params)
  end

  private

  def search_params
    if valid_search?
      params.permit(:location, bodies:[])
    else
      flash[:errors] = "Must select at least one celestial body"
      render :new
    end
  end

  def valid_search?
    params[:bodies].present?
  end

end
