class TelescopeController < ApplicationController
  def create
    body = CelestialBodies.find(params[:celestial_body_id])
    body_name = body.name.downcase
    coordinates_array = params[:telescope][:location].split(",")

    latitude = coordinates_array[0].to_s.gsub(" ", "_")
    longitude = coordinates_array[1].to_s.gsub(" ", "_")

    ephemeris_data = Faraday.get("https://skyfield-json.herokuapp.com/telescope_tracking?latitude=#{latitude}&longitude=#{longitude}&body=#{body_name}")

    motor = TelescopeMove.new(ephemeris_data)

    scope_movement = Faraday.get("http://#{params[:ngrok_url]}/scopetrack?locate_object_ra_steps=#{motor.locate_ra_steps}&locate_object_dec_steps=#{motor.locate_dec_steps}&track_dec_delay=#{motor.track_dec_delay}&track_dec_steps=#{motor.track_dec_steps}&track_ra_delay=#{motor.track_ra_delay}&track_ra_steps=#{motor.track_ra_steps}&return_home_dec_steps=#{motor.total_steps[:dec_steps]}&return_home_ra_steps=#{motor.total_steps[:ra_steps]}")
    flash[:message] = "Your telescope has now started tracking #{body_name}!"
    #redirect_to #something show page
  end
end
