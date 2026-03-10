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

ActiveRecord::Schema[8.1].define(version: 2026_03_09_215627) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "registrations", force: :cascade do |t|
    t.date "birth_date", null: false
    t.string "category", null: false
    t.string "city", null: false
    t.string "club"
    t.datetime "created_at", null: false
    t.string "discipline", null: false
    t.string "email", null: false
    t.string "first_name", null: false
    t.boolean "gdpr_consent", default: false, null: false
    t.string "gender", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.string "t_shirt_size", null: false
    t.boolean "terms_consent", default: false, null: false
    t.datetime "updated_at", null: false
  end
end
