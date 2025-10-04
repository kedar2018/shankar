class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :event_date
      t.string :location
      t.text :description
      t.string :slug
      t.boolean :published, null: false, default: true

      t.timestamps
    end
    add_index :events, :slug
  end
end
