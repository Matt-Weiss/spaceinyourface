class TelescopeMove

  def initialize(ephemeris_data)
    @ephemeris_data = ephemeris_data[:data]
  end

  def dec_delta
    @ephemeris_data[:start_dec].to_f - @ephemeris_data[:end_dec].to_f
  end

  def ra_delta
    @ephemeris_data[:start_ra].to_f - @ephemeris_data[:end_ra].to_f
  end

  #track_dec_steps =  dec_delta * 30
  #track_dec_delay_in_milliseconds = 360000 / steps
  #track_ra_steps = ra_delta * 1200
  #track_ra_delay_in_milliseconds = 360000 / steps
  #move_to_start_dec = start_dec * 30
  #move_to_start_ra = start_ra * 1200
  #return to zero = start steps + track steps RUN IN REVERSE
end
