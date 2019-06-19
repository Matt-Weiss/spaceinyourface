class GeocodeController < ApplicationController
  def show
    render json: MapboxService.new(params[:longlat]).returned_locations
  end
end
