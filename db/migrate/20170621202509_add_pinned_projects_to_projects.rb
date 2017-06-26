class AddPinnedProjectsToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :pinned_project, :boolean, default: false
  end
end
