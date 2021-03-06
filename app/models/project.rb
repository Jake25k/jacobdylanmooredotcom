class Project < ApplicationRecord
  validates :title, :description, :content, :project_type, presence: true

  has_attached_file :cover_image, :default_url => "default-thumbnail.jpg"
  validates_attachment :cover_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  scope :drafted, -> { where(draft: :true) }
  scope :notDrafted, -> { where(draft: :false) }

  def project_title
    if self.draft == true
      "#{self.title} (DRAFT)"
    elsif self.completed == true
      "#{self.title}"
    else
      "#{self.title} (In Progress)"
    end
  end
end
