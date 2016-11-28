class AddOverviewToTalks < ActiveRecord::Migration[5.0]
  def change
    add_column :talks, :overview, :text
  end
end
