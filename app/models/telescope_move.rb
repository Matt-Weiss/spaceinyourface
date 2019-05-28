class TelescopeMove
  attr_reader :total_steps

  def initialize(ephemeris_data)
    @ephemeris_data = ephemeris_data[:data]
    @total_steps = Hash.new(0)
  end

  def move_to_start_dec
    dec_steps = (@ephemeris_data[:start_dec].to_f * 30).to_i
    @total_steps[:dec_steps] += dec_steps
  end

  def move_to_start_ra
    ra_steps = (@ephemeris_data[:start_ra].to_f * 1200).to_i
    @total_steps[:ra_steps] += ra_steps
  end

  def dec_delta
    @ephemeris_data[:end_dec].to_f - @ephemeris_data[:start_dec].to_f
  end

  def ra_delta
    @ephemeris_data[:end_ra].to_f - @ephemeris_data[:start_ra].to_f
  end

  def track_dec_steps
    track_dec_steps = (dec_delta * 30).to_i
    @total_steps[:dec_steps] += track_dec_steps
  end

  def track_ra_steps
    track_ra_steps = (ra_delta * 1200).to_i
    @total_steps[:ra_steps] += track_ra_steps
  end

  def track_dec_delay
    track_dec_delay = 3600000 / track_dec_steps
    #track_dec_delay_in_milliseconds = 3600000 / steps
  end
  def return_to_zero
    #return to zero = start steps + track steps RUN IN REVERSE
  end

  #track_ra_steps = ra_delta * 1200
  #track_ra_delay_in_milliseconds = 3600000 / steps
end
