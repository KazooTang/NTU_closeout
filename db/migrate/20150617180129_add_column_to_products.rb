class AddColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :string
    add_column :products, :p_name, :string
    add_column :products, :place, :string
    rename_column :products, :name, :u_name
  end
end
