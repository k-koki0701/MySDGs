class EventMessage < ApplicationRecord
  belongs_to :user
  belongs_to :event_room
end
