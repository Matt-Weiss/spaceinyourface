class Coordinate

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def latitude
    if @coordinate >= 0
      "#{@coordinate}_N"
    else
      "#{removed_negative}_S"
    end
  end

  def longitude
    if @coordinate >= 0
      "#{@coordinate}_E"
    else
      "#{removed_negative}_W"
    end
  end

  private

  def removed_negative
    @coordinate * -1
  end
end
