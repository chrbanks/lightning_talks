class AddUniqueIndexToFavorites < ActiveRecord::Migration[5.0]
  def change
    add_index :favorites, [:user_id, :talk_id], unique: true
  end
end
