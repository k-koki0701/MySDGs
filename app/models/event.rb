class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :category

  has_many :participations, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, length: { in: 1..30 }
  validates :content, presence: true
  validates :image, presence: true
  validates :schedule, presence: true
  validates :category_id, presence: true

  scope :after_tomorrow_schedule, -> {where("events.schedule > ?", DateTime.now).reorder(:schedule).order("id DESC")}

end
