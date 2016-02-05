class PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
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

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :id)
  end
end
