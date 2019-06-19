class NgrokService
  def initialize(url, ephemeris_data)
    @url = url
    @ephemeris_data = ephemeris_data
    @motor = motor
  end


  def conn
    Faraday.get "https://#{@url}.ngrok.io/scopetrack", track_params
  end

  def self.test_conn(ngrok_id)
    Faraday.get("https://#{ngrok_id}.ngrok.io/scopetest")
  end

  private
    def track_params
      {
        move_to_start_ra: @motor.move_to_start_ra,
        move_to_start_dec: @motor.move_to_start_dec,
        track_dec_delay: @motor.track_dec_delay,
        track_dec_steps: @motor.track_dec_steps,
        track_ra_delay: @motor.track_ra_delay,
        track_ra_steps: @motor.track_ra_steps,
        return_home_dec_steps: @motor.total_steps['dec_steps'],
        return_home_ra_steps: @motor.total_steps['ra_steps']
      }
    end

    def motor
      TelescopeMove.new(@ephemeris_data.body_data)
    end
end
