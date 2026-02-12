class CreateSites < ActiveRecord::Migration[8.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :slug
      t.string :subdomain
      t.string :tagline
      t.string :region
      t.string :province
      t.string :municipality
      t.string :barangay
      t.string :logo
      t.string :hero_image
      t.string :primary_color
      t.string :secondary_color
      t.string :phone
      t.string :email
      t.string :address
      t.string :office_hours
      t.decimal :latitude
      t.decimal :longitude
      t.boolean :published
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :sites, :slug, unique: true
    add_index :sites, :subdomain, unique: true
  end
end
