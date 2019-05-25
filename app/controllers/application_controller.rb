class ApplicationController < ActionController::Base
  helper_method :current_user,
                :celestial_bodies

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def celestial_bodies
    @celestial_bodies ||= CelestialBodies.all
  end

end
