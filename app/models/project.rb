class Project < ApplicationRecord
  include ActionView::Helpers::TagHelper
  validates :title, :description, :content, :project_type, presence: true

  has_attached_file :cover_image, :default_url => "default-thumbnail.jpg"
  validates_attachment :cover_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  scope :drafted, -> { where(draft: :true) }
  scope :notDrafted, -> { where(draft: :false) }

  def project_title
    if self.draft == true
       content_tag(:div, "#{self.title} (DRAFT)", class: "project-panel-title center")
     else
       content_tag(:div, "#{self.title}", class: "project-panel-title center")
    end
  end

  def project_cover_image_with_text
    if self.cover_image.url == "default-thumbnail.jpg"
      content_tag(:div, self.project_title, class: "cover_image", style: "background-image: asset_url('default-thumbnail.jpg');")
    else
      content_tag(:div, self.project_title, class: "cover_image", style: "background-image: url('#{self.cover_image.url}');');")
    end
  end
end
