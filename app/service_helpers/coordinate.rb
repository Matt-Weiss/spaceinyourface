class Coordinate

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def latitude
    if @coordinate >= 0
      "#{@coordinate}_N"
    else
      "#{@coordinate}_S"
    end
  end

  def longitude
    if @coordinate >= 0
      "#{@coordinate}_E"
    else
      "#{@coordinate}_W"
    end
  end
end
