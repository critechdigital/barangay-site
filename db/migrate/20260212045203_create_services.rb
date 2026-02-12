class CreateServices < ActiveRecord::Migration[8.1]
  def change
    create_table :services do |t|
      t.references :site, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.text :requirements
      t.text :fees
      t.string :processing_time
      t.string :category
      t.integer :sort_order

      t.timestamps
    end
  end
end
