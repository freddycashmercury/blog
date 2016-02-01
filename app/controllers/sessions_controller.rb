class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(auth_params[:username])
    if user && user.authenticate(auth_params[:password])
      flash[:notice] = "You have logged in!"
      login(user)
      redirect_to root_path
    else
      flash.now.alert = "Incorrect username or password"
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
    params.require(:session).permit(:username, :password, :email)
  end
end
