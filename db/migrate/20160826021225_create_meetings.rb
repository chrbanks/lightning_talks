class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.datetime :date, null: false
      t.string :title, null: false
      t.references :user, foreign_key: true
      t.string :location, null: false

      t.timestamps
    end
  end
end
