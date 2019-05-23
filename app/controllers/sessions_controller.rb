class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash
      create_user_from_oauth
    else
      local_auth
    end
  end

  def delete
  end

  private

  def create_user_from_oauth
    user = User.find_by(email: parse_email)
    if user.nil?
      user = User.new(
        user_name: parse_user_name,
        email: parse_email,
        google_token: user_google_token
      )
      user.save(validate: false)
    end
    flash[:success] = "Successfully logged in!"
    redirect_to root_path
  end

  def parse_user_name
    email = auth_hash['info']['email']
    email.split("@").first
  end

  def parse_email
    auth_hash['info']['email']
  end

  def user_google_token
    auth_hash['credentials']['token']
  end

  def local_auth
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to root_path
    else
      flash[:errors] = "Invalid Credentials"
      render :new
    end
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end
