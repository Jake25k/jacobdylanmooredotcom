class HomepageController < ApplicationController

  def home
    @projects = Project.where(pinned_project: true).limit(5)
    @posts = Post.all.order("created_at DESC").limit(10)
  end

end
