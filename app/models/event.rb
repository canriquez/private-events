class Event < ApplicationRecord
    has_many :event_invitations, foreign_key: "attended_event_id" 
    belongs_to :creator, class_name: "User"
    has_many :guests, through: :event_invitations, source: :attendee


    def self.future
        self.all.includes(:creator).where("date >= ? ", Date.today);
    end

    def self.past
        self.all.includes(:creator).where("date <= ? ", Date.today);
    end
end
