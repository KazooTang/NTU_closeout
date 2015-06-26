class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :attachments, :pid, :attachment_id
    rename_column :attachments, :picture, :full_picture
    rename_column :products, :pid, :product_id
    rename_column :products, :uid, :seller_id
    rename_column :products, :u_name, :seller_name
    rename_column :products, :p_name, :product_name
    rename_column :products, :picture, :full_picture
    add_column :products, :picture, :string
  end
end
