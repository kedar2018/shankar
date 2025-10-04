class CreateTemples < ActiveRecord::Migration[7.1]
  def change
    create_table :temples do |t|
      t.string :name
      t.string :city
      t.string :address
      t.decimal :latitude,  precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.text :description
      t.string :slug
      t.boolean :published, null: false, default: true

      t.timestamps
    end
    add_index :temples, :slug
  end
end
