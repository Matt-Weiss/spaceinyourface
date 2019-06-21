class SearchController < ApplicationController

  def new
    PingSkyfieldJob.perform_async
  end

  def index
    if params[:button] == "planet_search"
      @facade = SearchResultsFacade.new(search_params)
    elsif params[:button] == "iss_search"
      @facade = IssSearchResultFacade.new(iss_search_params)
    end
  end

  private

  def search_params
    if valid_search?
      params.permit(:location, :button, bodies:[])
    else
      render :new
    end
  end

  def valid_search?
    if valid_bodies? && valid_location?
      true
    elsif !valid_bodies?
      flash.now[:errors] = "Must select at least one celestial body"
      false
    elsif !valid_location?
      flash.now[:errors] = "Invalid location entry, please try again"
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

  def iss_search_params
    if valid_location?
      params.permit(:location, :button)
    else
      flash[:errors] = "Invalid location entry, please try again"
      render :new
    end


  end

end
