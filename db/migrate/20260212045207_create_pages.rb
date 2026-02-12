class CreatePages < ActiveRecord::Migration[8.1]
  def change
    create_table :pages do |t|
      t.references :site, null: false, foreign_key: true
      t.string :title
      t.string :slug
      t.text :body
      t.string :page_type
      t.integer :sort_order
      t.boolean :published

      t.timestamps
    end
  end
end
