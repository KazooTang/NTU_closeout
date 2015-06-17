class AddColumnToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :message, :text
  end
end
