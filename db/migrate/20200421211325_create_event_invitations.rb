class CreateEventInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :event_invitations do |t|
      t.references :event, foreign_key: true
      # t.references :attendee, foreign_key: true

      t.timestamps
    end
  end
end
