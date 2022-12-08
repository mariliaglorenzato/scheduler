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

ActiveRecord::Schema[7.0].define(version: 2022_12_19_121206) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointment_guests", force: :cascade do |t|
    t.bigint "appointment_id"
    t.string "email", null: false
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_appointment_guests_on_appointment_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.string "locale"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "contact_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_contact_groups", force: :cascade do |t|
    t.integer "user_contact_id", null: false
    t.integer "contact_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_contacts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "email", null: false
    t.string "phone_number"
    t.string "name", null: false
    t.datetime "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_contacts_on_user_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "taxpayer_registry", null: false
    t.datetime "birth_date"
    t.string "address"
    t.string "street_number"
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.string "encrypted_password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
