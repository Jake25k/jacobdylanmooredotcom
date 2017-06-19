class HomepageController < ApplicationController

  def home
    @projects = Project.all.order("created_at DESC").limit(5)
    @posts = Post.all.order("created_at DESC").limit(10)
  end

end
