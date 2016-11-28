class AddMeetingDateIndexToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_index :meetings, :date
  end
end
