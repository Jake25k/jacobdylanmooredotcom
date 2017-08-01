class PostsController < ApplicationController

  before_action :authenticate_admin!, except: [:show, :index]

  def index
    @posts = Post.all
    @posts= @posts.paginate(:page => params[:page], :per_page => 15)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
      flash.now[:notice] = "Your post was posted!"
    else
      flash.now[:alert] = "Failed to post."
      render action: "new"
    end
  end

  def show
    @post = Post.find(params[:id])

    # Users cant view hidden posts
    if @post.draft == true
      if !current_admin
        redirect_to root_path
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render action: "new"
    end

    # Keep created_at time up to date until the data is ready for publication
    if @post.draft == true
      @post.update_attributes(created_at: Time.now)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :draft)
  end
end
