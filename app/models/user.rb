class User < ApplicationRecord

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
    validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      format: { with: VALID_EMAIL_REGEX, message: 'The email is not valid' }

    validates :name, presence: true, length: { maximum: 50 }

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
