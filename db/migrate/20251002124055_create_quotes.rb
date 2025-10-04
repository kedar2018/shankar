class CreateQuotes < ActiveRecord::Migration[7.1]
  def change
    create_table :quotes do |t|
      t.text :content
      t.string :source
      t.string :slug
      t.boolean :published, null: false, default: true

      t.timestamps
    end
    add_index :quotes, :slug
  end
end
