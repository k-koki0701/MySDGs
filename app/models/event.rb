class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :category

  has_many :participations, dependent: :destroy

  mount_uploader :image, ImageUploader
end
