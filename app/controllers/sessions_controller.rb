class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash
      create_user_from_oauth
      # log in
      binding.pry
    else
    # binding.pry
    end
    flash[:success] = "Successfully logged in!"
    redirect_to root_path
    # request.env['omniauth.auth']
  end

  def delete
  end

  private

  def create_user_from_oauth
    user = User.find_or_create_by(email: auth_hash['email'])
  end

  def auth_hash
    request.env['omniauth.auth']['info']
  end

end
