class ProjectsController < ApplicationController

  before_action :authenticate_admin!, except: [:show, :index, :getProjectTypePartial]

  def index
    if current_admin
      @projects = Project.all
    else
      @projects = Project.notDrafted
    end

    @projectsForTags = @projects
    @projects = @projects.all.paginate(:page => params[:page], :per_page => 6)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.project_type = (@project.project_type.downcase)

    if @project.save
      redirect_to project_path(@project)
      flash.now[:notice] = "Your project was posted!"
    else
      flash.now[:alert] = "Failed to post."
      render action: "new"
    end
  end

  def show
    @project = Project.find(params[:id])

    # Users cant view hidden projects
    if @project.draft == true
      if !current_admin
        redirect_to root_path
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render action: "new"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def pinOrUnpinProject
    project = Project.find(params[:id])

    if project.pinned_project == true
      project.update_attributes(pinned_project: false)
    else
      project.update_attributes(pinned_project: true)
    end
    redirect_to project_path(project)
  end

  def getProjectTypesAsJson
    render json: Project.all.map(&:project_type).uniq
  end

  def getProjectTypePartial

    if current_admin
      projectList = Project.where(project_type: params[:project_type].gsub('_',' '))
    else
      availableProjects = Project.notDrafted
      projectList = availableProjects.where(project_type: params[:project_type].gsub('_',' '))
    end

    render partial: '/projects/projectType', locals: {projects: projectList}
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :content, :pinned_project, :project_type, :draft, :cover_image)
  end
end
