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

end
