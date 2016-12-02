class AddAttachmentToTalk < ActiveRecord::Migration[5.0]
  def change
    add_column :talks, :attachment, :text
  end
end
