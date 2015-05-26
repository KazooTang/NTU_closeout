class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :image_src
      t.string :oid
      t.string :ourl
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
