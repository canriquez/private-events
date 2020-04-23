class DropColumns < ActiveRecord::Migration[5.2]
  def change
    # remove_column :event_invitations, :attendee_id
    add_column :event_invitations, :user_id, :integer
  end
end
