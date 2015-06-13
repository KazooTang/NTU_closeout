class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :attachments, :image_src, :picture
    rename_column :attachments, :oid, :pid
    rename_column :attachments, :ourl, :link
  end
end
