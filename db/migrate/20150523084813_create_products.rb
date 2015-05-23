class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :pid, null: false
      t.string :uid
      t.string :name

      t.text :message
      t.string :picture
      t.string :link
      t.datetime :created_time
      t.datetime :updated_time
      t.timestamps null: false
    end
  end
end
