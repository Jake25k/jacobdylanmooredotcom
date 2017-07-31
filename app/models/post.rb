class Post < ApplicationRecord
  validates :title, :content, presence: true

  scope :drafted, -> { where(draft: :true) }
  scope :notDrafted, -> { where(draft: :false) }
end
