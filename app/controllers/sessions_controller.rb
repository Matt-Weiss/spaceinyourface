class SessionsController < ApplicationController

  def new
  end

  def create
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
