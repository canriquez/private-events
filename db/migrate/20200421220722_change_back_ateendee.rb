class ChangeBackAteendee < ActiveRecord::Migration[5.2]
  def change
    remove_column :event_invitations, :event_id
    add_column :event_invitations, :attendee_id, :integer
  end
end
