class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
      flash.now[:notice] = "Your project was posted!"
    else
      flash.now[:alert] = "Failed to post."
      render action: "new"
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :content)
  end
end
