class Project < ApplicationRecord
  validates :title, :description, :content, :project_type, presence: true

end
