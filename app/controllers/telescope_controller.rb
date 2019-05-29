class TelescopeController < ApplicationController
  def create
    ephemeris_data = SkyfieldService.new(user_coordinates, body_name, "telescope_tracking")
    NgrokService.new(params[:ngrok_url], ephemeris_data)
    flash[:message] = "Your telescope has now started tracking #{body_name[0]}!"
    redirect_to celestial_body_path(body.name, location: user_coordinates)
  end

  private

    def body
      CelestialBodies.find(params[:celestial_body_id])
    end

    def body_name
      # SkyfieldSerivce is expecting an array of body names
      [body.name.downcase]
    end

    def user_coordinates
      # SkyfieldService is expecting the array to come in [long, lat]
      params[:telescope][:location].split(",").reverse
    end
end
