# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_02_12_045207) do
  create_table "announcements", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "image"
    t.boolean "published"
    t.datetime "published_at"
    t.integer "site_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_announcements_on_site_id"
  end

  create_table "officials", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "photo"
    t.string "position"
    t.integer "site_id", null: false
    t.integer "sort_order"
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_officials_on_site_id"
  end

  create_table "pages", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "page_type"
    t.boolean "published"
    t.integer "site_id", null: false
    t.string "slug"
    t.integer "sort_order"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_pages_on_site_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.text "description"
    t.text "fees"
    t.string "name"
    t.string "processing_time"
    t.text "requirements"
    t.integer "site_id", null: false
    t.integer "sort_order"
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_services_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "address"
    t.string "barangay"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "hero_image"
    t.decimal "latitude"
    t.string "logo"
    t.decimal "longitude"
    t.string "municipality"
    t.string "name"
    t.string "office_hours"
    t.string "phone"
    t.string "primary_color"
    t.string "province"
    t.boolean "published"
    t.string "region"
    t.string "secondary_color"
    t.string "slug"
    t.string "subdomain"
    t.string "tagline"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["slug"], name: "index_sites_on_slug", unique: true
    t.index ["subdomain"], name: "index_sites_on_subdomain", unique: true
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.integer "role"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "announcements", "sites"
  add_foreign_key "officials", "sites"
  add_foreign_key "pages", "sites"
  add_foreign_key "services", "sites"
  add_foreign_key "sites", "users"
end
