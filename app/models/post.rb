class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  has_many_attached :photos
  has_one_attached :thumbnail_image
  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?
end
