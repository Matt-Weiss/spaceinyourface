class IssAlertsController < ApplicationController
  def create
    phone_number = '+1' + params['phone']
    formatted_phone_number = params['phone'][0..2] + '-' + params['phone'][3..5] + '-' + params['phone'][6..9]
    scheduled_time = Time.parse(params['scheduled_time'])

    rise_time = scheduled_time + (15 * 60)
    formatted_rise_time = rise_time.strftime("%a %b%e %l:%M%p %Z")

    message = "The International Space Station will be rising near you soon: #{formatted_rise_time}. SpaceInYourFace.herokuapp.com"

    alert = TextAlert.perform_at(scheduled_time, phone_number, message)

    flash[:message] = "#{formatted_phone_number} - Text message successfully scheduled for next ISS rise time: #{formatted_rise_time}."
    redirect_to root_path
  end
end
