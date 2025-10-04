class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.boolean :published, null: false, default: true

      t.timestamps
    end
    add_index :pages, :slug
  end
end
