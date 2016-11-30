class RemoveNullDescriptionConstraintFromTalks < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:talks, :description, true)
  end
end
