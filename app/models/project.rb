class Project < ApplicationRecord
  validates :title, :description, :content, presence: true

end
