class CreateAnnouncements < ActiveRecord::Migration[8.1]
  def change
    create_table :announcements do |t|
      t.references :site, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.string :image
      t.boolean :published
      t.datetime :published_at

      t.timestamps
    end
  end
end
