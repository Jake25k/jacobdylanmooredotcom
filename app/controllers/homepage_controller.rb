class HomepageController < ApplicationController

  def home
    @projects = Project.where(pinned_project: true)
    @posts = Post.all.order("created_at DESC").limit(10)
  end

  def alt_home
    @projects = Project.where(pinned_project: true)
    @posts = Post.all.order("created_at DESC").limit(10)
  end

end
