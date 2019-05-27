class CelestialBodiesController < ApplicationController
  def show
    render locals: {
      facade: CelestialBodyFacade.new(params["id"])
    }
  end
end
