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

ActiveRecord::Schema[8.1].define(version: 2026_03_10_135421) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "editions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "date", null: false
    t.decimal "entry_fee", precision: 8, scale: 2, default: "10.0"
    t.integer "max_capacity", default: 500
    t.boolean "published", default: false, null: false
    t.datetime "registration_ends_at"
    t.datetime "registration_starts_at"
    t.integer "registrations_count", default: 0, null: false
    t.datetime "updated_at", null: false
    t.integer "year", null: false
    t.index ["published"], name: "index_editions_on_published"
    t.index ["year"], name: "index_editions_on_year", unique: true
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "bib_number"
    t.date "birth_date", null: false
    t.string "category", null: false
    t.string "city", null: false
    t.string "club"
    t.datetime "created_at", null: false
    t.string "discipline", null: false
    t.bigint "edition_id", null: false
    t.string "email", null: false
    t.string "first_name", null: false
    t.boolean "gdpr_consent", default: false, null: false
    t.string "gender", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.string "t_shirt_size", null: false
    t.boolean "terms_consent", default: false, null: false
    t.datetime "updated_at", null: false
    t.index ["edition_id", "bib_number"], name: "index_registrations_on_edition_id_and_bib_number", unique: true
    t.index ["edition_id"], name: "index_registrations_on_edition_id"
  end

  create_table "schedule_items", force: :cascade do |t|
    t.string "badge_color"
    t.datetime "created_at", null: false
    t.text "description"
    t.bigint "edition_id", null: false
    t.time "start_time"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["edition_id"], name: "index_schedule_items_on_edition_id"
  end

  add_foreign_key "registrations", "editions"
  add_foreign_key "schedule_items", "editions"
end
