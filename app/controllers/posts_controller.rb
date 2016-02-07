class PostsController < ApplicationController
  before_action :correct_user, only: [:new, :create, :update, :edit]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = current_user.posts.new 
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to user_posts_path
    else
      flash[:notice] = "Something went wrong!"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post updated"
      redirect_to user_posts_path
    else
      flash[:notice] = "Something went wrong!"
      redirect_to root_path
    end
  end

  private

  def correct_user
    @user = User.find(params[:user_id])
    (flash[:notice] = "Not authorized") && redirect_to(root_url) unless @user == current_user
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :id, :user)
  end
end
