class Event < ApplicationRecord
    has_many :event_invitations
    belongs_to :creator, class_name: "User"
    has_many :guests, through: :event_invitations, source: :attendee
end
