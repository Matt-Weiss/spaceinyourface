class CelestialBodyFacade
  attr_reader :name

  def initialize(name)
    @name = name
    @body = CelestialBodies.find_by(name: name)
  end

  def description
    @body.description
  end
end
