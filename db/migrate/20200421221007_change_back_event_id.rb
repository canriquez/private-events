class ChangeBackEventId < ActiveRecord::Migration[5.2]
  def change
    add_column :event_invitations, :event_id, :integer
    remove_column :event_invitations, :user_id
  end
end
