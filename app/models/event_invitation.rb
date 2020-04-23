class EventInvitation < ApplicationRecord
  belongs_to :attended_event, class_name: 'Event'
  belongs_to :attendee, class_name: 'User'
  validates :attendee, uniqueness: { scope: [:attended_event, :attendee] }

  #validates_uniqueness_of :attended_event_id, :scope => :attendee_id
end
