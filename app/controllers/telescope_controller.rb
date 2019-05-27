class TelescopeController < ApplicationController
  def create
    params[:location] = 80125
    params[:body] = "luna"

    coordinates_array = MapBoxService.new(80125).returned_locations

    latitude = coordinates_array[0].to_s
    longitude = coordinates_array[1].to_s

    ephemeris_data = Faraday.get("https://skyfield_json.herokuapp.com/telescope_tracking?latitude=#{latitude}&longitude=#{longitude}&body=#{params[:body]}")

    motor = TelescopeMove.new(ephemeris_data)

    scope_movement = Faraday.get("http://insert ngrok url here/scopetrack?locate_object_ra_steps=#{motor.locate_ra_steps}&locate_object_dec_steps=#{motor.locate_dec_steps}&track_dec_delay=#{motor.track_dec_delay}&track_dec_steps=#{motor.track_dec_steps}&track_ra_delay=#{motor.track_ra_delay}&track_ra_steps=#{motor.track_ra_steps}&return_home_dec_steps=#{motor.return_home_dec_steps}&return_home_ra_steps=#{motor.return_home_ra_steps}")
    flash[:message] = "Your telescope has now started tracking #{params[:body]}!"
    #redirect_to #something show page
  end
end
