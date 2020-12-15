class Folder < ApplicationRecord
  validates :name, :image, presence: true

  has_one_attached :image
end
