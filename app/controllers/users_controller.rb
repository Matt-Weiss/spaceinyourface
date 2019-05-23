class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Thank you for signing up - you are successfully logged in!"
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end

end
