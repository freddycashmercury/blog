class FeedsController < ApplicationController

  def index
    @feeds = Feed.all
  end

  def show
    @user = User.find(params[:user_id])
    @feed = @user.feed
  end

  def new
    @user = User.find(params[:user_id])
    @feed = @user.feed
  end

  def create 
    @feed = current_user.create_feed(feed_params)
    if @feed.save
      flash[:notice] = "Blog created"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Something went wrong!"
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @feed = @user.feed
  end

  def update
    @user = User.find(params[:user_id])
    @feed = @user.feed
    if @feed.update(feed_params)
      flash[:notice] = "Feed updated!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Something went wrong!"
      redirect_to root_path
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:user_id, :name, :description, :id)
  end
end
