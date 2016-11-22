class AddCommentsCountToTalks < ActiveRecord::Migration[5.0]
  def change
    add_column :talks, :comments_count, :integer, default: 0

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE talks
           SET comments_count = (SELECT count(1)
                                   FROM comments
                                  WHERE comments.commentable_id = talks.id)
    SQL
  end  
end
