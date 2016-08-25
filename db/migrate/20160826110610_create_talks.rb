class CreateTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :talks do |t|
      t.references :meeting, foreign_key: true
      t.string :title, null: false
      t.references :user, foreign_key: true
      t.text :description, null: false

      t.timestamps
    end
  end
end
