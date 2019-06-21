class SearchBody
  attr_reader :name

  def initialize(body_hash)
    @name = body_hash["name"].capitalize
    @decimal_attributes = body_hash["decimal_attributes"]
    @strf_attributes = body_hash["strf_attributes"]
  end

  def user_ra
    @strf_attributes["ra"]
  end

  def user_dec
    @strf_attributes["dec"]
  end

  def user_az
    @strf_attributes["az"]
  end

  def user_el
    @strf_attributes["el"]
  end

  def scope_ra
    @decimal_attributes["ra"]
  end

  def scope_dec
    @decimal_attributes["dec"]
  end

  def scope_az
    @decimal_attributes["az"]
  end

  def scope_el
    @decimal_attributes["el"]
  end

  def az_messaging
    if scope_az.to_f >= 0 && scope_az.to_f < 11.25
      "North"
    elsif scope_az.to_f >= 11.25 && scope_az.to_f < 33.75
      "North-NorthEast"
    elsif scope_az.to_f >=33.75 && scope_az.to_f < 56.25
      "NorthEast"
    elsif scope_az.to_f >=56.25 && scope_az.to_f < 78.75
      "East-NorthEast"
    elsif scope_az.to_f >=78.75 && scope_az.to_f < 101.25
      "East"
    elsif scope_az.to_f >=101.25 && scope_az.to_f < 123.75
      "East-SouthEast"
    elsif scope_az.to_f >=123.75 && scope_az.to_f < 146.25
      "SouthEast"
    elsif scope_az.to_f >=146.25 && scope_az.to_f < 168.75
      "South-SouthEast"
    elsif scope_az.to_f >=168.75 && scope_az.to_f < 191.25
      "South"
    elsif scope_az.to_f >=191.25 && scope_az.to_f < 213.75
      "South-SouthWest"
    elsif scope_az.to_f >=213.75 && scope_az.to_f < 236.25
      "SouthWest"
    elsif scope_az.to_f >=236.25 && scope_az.to_f < 258.75
      "West-SouthWest"
    elsif scope_az.to_f >=258.75 && scope_az.to_f < 281.25
      "West"
    elsif scope_az.to_f >=281.25 && scope_az.to_f < 303.75
      "West-NorthWest"
    elsif scope_az.to_f >=303.75 && scope_az.to_f < 326.25
      "NorthWest"
    elsif scope_az.to_f >=326.25 && scope_az.to_f < 348.75
      "North-NorthWest"
    else
      "North"
    end
  end

  def el_messaging
    (scope_el.to_i/5)*2
  end

end
