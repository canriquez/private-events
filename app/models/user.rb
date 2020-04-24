class User < ApplicationRecord
  attr_accessor :new_notice
  after_save :new_user_was_saved_to_db
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX, message: 'The email is not valid' }

  validates :name, presence: true, length: { maximum: 50 }

  has_many :events, foreign_key: 'creator_id'
  has_many :event_invitations, foreign_key: 'attendee_id', class_name: 'EventInvitation'
  has_many :attended_events, through: :event_invitations

  def create_token
    remember_me = Digest::SHA256.hexdigest(SecureRandom.urlsafe_base64.to_s)
    update_attribute('remember_me', remember_me)
    remember_me
  end

  def upcoming_events
    events.where('date >= ? ', Date.today)
  end

  def previous_events
    events.where('date <= ? ', Date.today)
  end

  def new_user_was_saved_to_db
    @new_notice = "new user #{self.name} successfully saved on the database"
    puts "new user #{self.name} successfully saved on the database"
  end


end
