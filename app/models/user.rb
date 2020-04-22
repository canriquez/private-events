class User < ApplicationRecord
    has_many :events, foreign_key: "creator_id"
    has_many :event_invitations, foreign_key: "attendee_id", class_name: "EventInvitation"



    def create_token
        remember_me = Digest::SHA256.hexdigest(SecureRandom.urlsafe_base64.to_s)
        update_attribute('remember_me', remember_me)
        remember_me
    end

    def upcoming_events
        self.events.where("date >= ? ", Date.today);
    end

    def previous_events
        self.events.where("date <= ? ", Date.today);
    end
end
