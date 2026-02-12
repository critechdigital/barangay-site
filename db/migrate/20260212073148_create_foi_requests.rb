class CreateFoiRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :foi_requests do |t|
      t.references :site, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.text :purpose
      t.text :description
      t.string :tracking_number
      t.integer :status
      t.datetime :received_at
      t.datetime :processed_at
      t.datetime :released_at
      t.text :admin_notes

      t.timestamps
    end
  end
end
