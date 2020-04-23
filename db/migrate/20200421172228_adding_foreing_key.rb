class AddingForeingKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :events, :users, column: :creator_id, primary_key: "id"

  end
end
