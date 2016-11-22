class AddCategoryToTalks < ActiveRecord::Migration[5.0]
  def change
    add_column :talks, :category, :string
  end
end
