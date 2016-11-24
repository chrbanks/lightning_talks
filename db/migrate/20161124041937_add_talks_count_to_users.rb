class AddTalksCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :talks_count, :integer, default: 0

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE users
           SET talks_count = (SELECT count(1)
                                   FROM talks
                                  WHERE talks.user_id = users.id)
    SQL
  end  
end
