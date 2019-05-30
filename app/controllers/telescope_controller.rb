class TelescopeController < ApplicationController
  def create
    if params[:commit] == "Test"
      # ephemeris_data =
      # test = NgrokService.new(params[:telescope][:ngrok_url].concat("/scopetest?"), ephemeris_data)
      # test.test_conn
      NgrokService.test_conn(params[:telescope][:ngrok_url])
      flash[:message] = "Running range of motion test on your telescope."
    else
      ephemeris_data = SkyfieldService.new(user_coordinates, body_name, "telescope_tracking")
      motion = NgrokService.new(params[:telescope][:ngrok_url].concat("/scopetrack?"), ephemeris_data)
      motion.conn
      flash[:message] = "Your telescope has now started tracking #{body_name[0]}!"
    end
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
