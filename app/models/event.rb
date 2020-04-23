class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :place, presence: true, length: { minimum: 10 }
  validates :date, presence: true

  has_many :event_invitations, foreign_key: 'attended_event_id'
  belongs_to :creator, class_name: 'User'
  has_many :guests, through: :event_invitations, source: :attendee

  scope :future, -> { all.includes(:creator).where('date > ? ', Date.today) }
  scope :past, -> { all.includes(:creator).where('date <= ? ', Date.today) }
end
