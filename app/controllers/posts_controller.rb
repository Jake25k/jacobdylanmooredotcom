class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      flash.now[:notice] = "Your post was posted!"
    else
      flash.now[:alert] = "Failed to post."
      render action: "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
