class AddTypeToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :project_type, :string
  end
end
