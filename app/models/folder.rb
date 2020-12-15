class Folder < ApplicationRecord
  validates :name, :image, presence: true
  validates :name, length: { maximum: 10 }

  has_one_attached :image
  has_many :records
end
