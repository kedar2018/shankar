class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :caption
      t.string :slug
      t.boolean :published, null: false, default: true

      t.timestamps
    end
    add_index :photos, :slug
  end
end
