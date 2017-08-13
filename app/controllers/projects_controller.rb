class ProjectsController < ApplicationController
  include ProjectsHelper

  before_action :authenticate_admin!, except: [:show, :index, :getProjectTypePartial]

  def index
    if current_admin
      @projects = Project.all
    else
      @projects = Project.notDrafted
    end

    @projectsForTags = project_types_as_array(Project).sort()
    @projectsForInProgress = project_types_as_array(Project).sort()
    @projects = @projects.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)

    render layout: 'projects_index'
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to project_path(@project)
      flash.now[:notice] = "Your project was posted!"
    else
      flash.now[:alert] = "Failed to post."
      render action: "new"
    end
  end

  def show
    @project = Project.find_by(id: params[:id])

    # Users cant view hidden projects
    if !@project.nil? && @project.draft == true
      if !current_admin
        redirect_to root_path
      end
    elsif @project.nil?
      redirect_to root_path
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
    render_project_types_as_json(Project.all)
  end

  def getProjectTypePartial
  array = []
    if current_admin
      if params[:project_type] != "InProgress"
        Project.all.each do |project|
          if project.project_type.include? params[:project_type].gsub('_',' ')
            array.append(project)
          end
        end
      else
        if params[:project_type] == "InProgress"
          Project.all.each do |project|
            if project.completed == false
              array.append(project)
            end
          end
        end
      end
      # projectList = Project.where(project_type: params[:project_type].gsub('_',' '))
    else
      availableProjects = Project.notDrafted
      if params[:project_type] != "InProgress"
        availableProjects.all.each do |project|
          if project.project_type.include? params[:project_type].gsub('_',' ')
            array.append(project)
          end
        end
      else
        if params[:project_type] == "InProgress"
          availableProjects.all.each do |project|
            if project.completed == false
              array.append(project)
            end
          end
        end
      end
    end
    render partial: '/projects/projectType', locals: {projects: array}
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :content, :pinned_project, :project_type, :draft, :completed, :cover_image)
  end
end
