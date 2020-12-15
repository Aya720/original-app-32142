class Folder < ApplicationRecord
  validates :name, presence: true

  has_one_attached :image
end
