class IssAlertsController < ApplicationController
  def create
    phone_number = '+1' + params['phone']
    formatted_phone_number = params['phone'][0..2] + '-' + params['phone'][3..5] + '-' + params['phone'][6..9]
    location = formatted_location(params['location'])
    time_zone = Timezone.lookup(location[1], location[0]).name
    rise_time = Time.parse(params['rise_time'])
    scheduled_time = rise_time - 15.minutes
    formatted_rise_time = rise_time.in_time_zone(time_zone).strftime("%A, %b %e at%l:%M%p %Z")

    alert = TextAlert.perform_at(scheduled_time, phone_number, message(formatted_rise_time))

    flash[:success] = "#{formatted_phone_number} - Text message successfully scheduled for next ISS rise time: #{formatted_rise_time}."
    redirect_to new_search_path
  end

  private

    def message(formatted_rise_time)
      "The International Space Station will be rising near you soon: #{formatted_rise_time}. SpaceInYourFace.herokuapp.com"
    end

    def formatted_location(strf_location)
      strf_location.split.map do |coord|
        coord.to_f
      end
    end
end
