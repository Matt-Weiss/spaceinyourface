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
      # flash[:errors] = "Must select at least one celestial body"
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
      flash[:errors] = "Must enter location information"
      false
    end
  end

  def valid_bodies?
    params[:bodies].present?
  end

  def valid_location?
    params[:location].present?
  end

end
