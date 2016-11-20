class AddFavoritesCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :favorites_count, :integer, default: 0

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE users
           SET favorites_count = (SELECT count(1)
                                   FROM favorites
                                  WHERE favorites.user_id = users.id)
    SQL
  end  
end
