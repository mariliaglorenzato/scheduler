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

ActiveRecord::Schema[7.0].define(version: 2022_11_22_231206) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointment_guests", force: :cascade do |t|
    t.bigint "appointment_id"
    t.bigint "user_contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "locale"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_contacts", force: :cascade do |t|
    t.bigint "contact_id"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "taxpayer_registry"
    t.datetime "birth_date"
    t.string "address"
    t.string "streetNumber"
    t.string "phone"
    t.string "email"
    t.string "name"
    t.string "encrypted_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
