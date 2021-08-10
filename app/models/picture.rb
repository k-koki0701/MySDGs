class Picture < ApplicationRecord
  belongs_to :post, optional: true
  validates_presence_of :post

  mount_uploader :image, ImageUploader
end
