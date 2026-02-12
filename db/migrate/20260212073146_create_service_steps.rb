class CreateServiceSteps < ActiveRecord::Migration[8.1]
  def change
    create_table :service_steps do |t|
      t.references :service, null: false, foreign_key: true
      t.integer :step_number
      t.string :title
      t.text :description
      t.string :responsible_person
      t.string :location
      t.string :duration
      t.string :fees
      t.text :notes

      t.timestamps
    end
  end
end
