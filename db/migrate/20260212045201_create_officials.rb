class CreateOfficials < ActiveRecord::Migration[8.1]
  def change
    create_table :officials do |t|
      t.references :site, null: false, foreign_key: true
      t.string :name
      t.string :position
      t.string :photo
      t.integer :sort_order

      t.timestamps
    end
  end
end
