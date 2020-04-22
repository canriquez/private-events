class ChangeToAttendedEvent < ActiveRecord::Migration[5.2]
  def change
    rename_column :event_invitations, :event_id, :attended_event_id
  end
end
