class PostsController < ApplicationController

  before_action :authenticate_admin!, except: [:show, :index]

  def index
    if current_admin
      @posts = Post.all
    else
      @posts = Post.notDrafted
    end

    @posts = @posts.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
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
    @post = Post.find_by(title: params[:id]) || Post.find_by(id: params[:id])

    # Users cant view hidden posts
    if !@project.nil? && @post.draft == true
      if !current_admin
        redirect_to root_path
      elsif @post.nil?
        redirect_to root_path
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    # variable used to see what the boolean was before the update
    trackBooleanBefore = @post.draft

    if @post.update_attributes(post_params)

      # if there is a switch from true to false, then update the time to reflect accurate publication
      trackBooleanAfter = @post.draft

      if (trackBooleanBefore == true && trackBooleanAfter == false)
        time = Time.now
        @post.update_attributes(created_at: time, updated_at: time)
      end
      redirect_to post_path(@post)
    else
      render action: "new"
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
