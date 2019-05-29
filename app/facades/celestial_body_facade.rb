class CelestialBodyFacade
  attr_reader :name,
              :user_location,
              :body

  def initialize(params)
    @name = params["id"]
    @user_location = params["location"]
    @body = CelestialBodies.find_by(name: name)
  end

  def description
    @body.description
  end

  def image
    @body.image_url
  end
end
