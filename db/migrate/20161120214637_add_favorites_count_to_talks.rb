class AddFavoritesCountToTalks < ActiveRecord::Migration[5.0]
  def change
    add_column :talks, :favorites_count, :integer, default: 0

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE talks
           SET favorites_count = (SELECT count(1)
                                   FROM favorites
                                  WHERE favorites.talk_id = talks.id)
    SQL
  end  
end
