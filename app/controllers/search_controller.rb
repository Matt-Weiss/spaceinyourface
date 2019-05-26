class SearchController < ApplicationController

  def new
  end

  def index
    search_params
    # render locals: {
    #   facade: SearchResultsFacade.new(search_params)
    # }
  end

  private

  def search_params
    if valid_search?
      params.permit(:zip_code, bodies:[])
    else
      flash[:errors] = "Must select at least one celestial body"
      render :new
    end
  end

  def valid_search?
    params[:bodies].present?
  end

end
