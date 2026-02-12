class CreateEmergencyContacts < ActiveRecord::Migration[8.1]
  def change
    create_table :emergency_contacts do |t|
      t.references :site, null: false, foreign_key: true
      t.string :name
      t.string :phone
      t.string :category
      t.integer :sort_order

      t.timestamps
    end
  end
end
