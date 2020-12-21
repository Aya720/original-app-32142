class Folder < ApplicationRecord
  validates :image, presence: true
  validates :name, length: { maximum: 10 }

  has_one_attached :image
  has_many :records, dependent: :destroy
end
