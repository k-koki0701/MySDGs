class EventRoom < ApplicationRecord
  belongs_to :event
  has_many :event_messages, dependent: :destroy
end
