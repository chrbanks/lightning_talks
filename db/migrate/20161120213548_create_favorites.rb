class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :talk, foreign_key: true

      t.timestamps
    end

    add_index :favorites, :user_id
    add_index :favorites, :talk_id
    add_index :favorites, [:user_id, :talk_id], unique: true
  end
end
