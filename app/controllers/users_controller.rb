class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created"
      redirect_to login_path
    else 
      flash[:notice] = "Invalid account information"
      render 'new'
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else 
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Profile updated"
      redirect_to(:back) 
    else
     render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user, :id, :username, :password,
                                 :password_confirmation, :email, :admin, :can_login) 
  end

end
