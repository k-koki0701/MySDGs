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
  validate :after_tomorrow

  def after_tomorrow
    errors.add(:schedule, 'は、明日以降の日付を選択してください') if !schedule.nil? && (schedule <= Date.today)
  end

  scope :after_tomorrow_schedule, -> { where('events.schedule > ?', DateTime.now).reorder(:schedule).order('id DESC') }
end
