class IssAlertsController < ApplicationController
  def create
    phone_number = '+1' + params['phone'].delete('-')
    scheduled_time = Time.parse(params['scheduled_time'])

    rise_time = scheduled_time + (15 * 60)
    message = "The Int'l Space Station will be rising near you at #{rise_time}. Space In Your Face!"

    alert = TextAlert.perform_at(scheduled_time, phone_number, message)

    flash[:message] = "Text message successfully scheduled for #{params[:phone]} for next ISS rise time at #{scheduled_time}."
    redirect_to root_path
  end
end
