class CreateDocuments < ActiveRecord::Migration[8.1]
  def change
    create_table :documents do |t|
      t.references :site, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :category
      t.string :file_url
      t.boolean :published
      t.integer :sort_order

      t.timestamps
    end
  end
end
