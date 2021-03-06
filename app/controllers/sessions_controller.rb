class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(auth_params[:username])
    if user && user.can_login? && user.authenticate(auth_params[:password])
      flash[:notice] = "You have logged in!"
      login(user)
      redirect_to user_path(user)
    elsif user && user.authenticate(auth_params[:password]) && !user.can_login
      flash.now.alert = "Please contact Cody to approve your account."
      render "new"
    else 
      flash.now.alert = "Incorrect username or password."
      render "new"
    end
  end

  def destroy
    log_out
    flash[:notice] = "You have logged out!"
    redirect_to root_path
  end

  private

  def auth_params
    params.require(:session).permit(:user, :user_id, :username, :password, :email)
  end
end
