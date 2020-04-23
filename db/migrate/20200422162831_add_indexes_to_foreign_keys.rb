class AddIndexesToForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_index :event_invitations, :attendee_id
    add_index :event_invitations, :attended_event_id
    add_index :users, :email
  end
end
