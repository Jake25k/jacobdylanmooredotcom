class Post < ApplicationRecord
  validates :title, :content, presence: true

  scope :drafted, -> { where(draft: :true) }
  scope :notDrafted, -> { where(draft: :false) }

  def post_title
    if self.draft == true
      "#{self.title} (DRAFT)"
    else
      "#{self.title}"
    end
  end
end
