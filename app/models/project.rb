class Project < ApplicationRecord
  validates :title, :description, :content, :project_type, presence: true

  scope :drafted, -> { where(draft: :true) }
  scope :notDrafted, -> { where(draft: :false) }
end
