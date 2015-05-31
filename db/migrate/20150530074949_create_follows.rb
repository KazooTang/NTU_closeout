class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :product, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
