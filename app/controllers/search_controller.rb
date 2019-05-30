class SearchController < ApplicationController

  def new
    PingSkyfieldJob.perform_now
  end

  def index
    @facade = SearchResultsFacade.new(search_params)
  end

  private

  def search_params
    if valid_search?
      params.permit(:location, bodies:[])
    else
      render :new
    end
  end

  def valid_search?
    if valid_bodies? && valid_location?
      true
    elsif !valid_bodies?
      flash[:errors] = "Must select at least one celestial body"
      false
    elsif !valid_location?
      flash[:errors] = "Invalid location entry, please try again"
      false
    end
  end

  def valid_bodies?
    params[:bodies].present?
  end

  def valid_location?
    mapbox = MapboxService.new(params[:location])
    
    params[:location].present? && mapbox.valid?
  end

end
