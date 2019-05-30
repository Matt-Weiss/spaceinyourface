class NgrokService
  def initialize(url, ephemeris_data)
    @url = url
    @ephemeris_data = ephemeris_data
    @motor = motor
  end


  def conn
    Faraday.get("#{@url}move_to_start_ra=#{@motor.move_to_start_ra}&move_to_start_dec=#{@motor.move_to_start_dec}&track_dec_delay=#{@motor.track_dec_delay}&track_dec_steps=#{@motor.track_dec_steps}&track_ra_delay=#{@motor.track_ra_delay}&track_ra_steps=#{@motor.track_ra_steps}&return_home_dec_steps=#{@motor.total_steps['dec_steps']}&return_home_ra_steps=#{@motor.total_steps['ra_steps']}")
  end

  def self.test_conn(url)
    Faraday.get("#{url}/scopetest?move_to_start_ra=-480&move_to_start_dec=-900&track_dec_delay=10&track_dec_steps=80&track_ra_delay=7&track_ra_steps=72&return_home_dec_steps=-900&return_home_ra_steps=624")
  end

  private

    def motor
      TelescopeMove.new(@ephemeris_data.body_data)
    end
end
