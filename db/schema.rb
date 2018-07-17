# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_17_230954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.datetime "start_time", null: false
    t.boolean "confirmed", default: false
    t.boolean "paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_reservations_on_spot_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address_1", null: false
    t.string "address_2", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.integer "zip", null: false
    t.string "size"
    t.boolean "avail_m"
    t.boolean "avail_t"
    t.boolean "avail_w"
    t.boolean "avail_th"
    t.boolean "avail_f"
    t.boolean "avail_sa"
    t.boolean "avail_su"
    t.integer "hourly_rate"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_spots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.boolean "spot_owner"
    t.string "vehicle_make"
    t.string "vehicle_model"
    t.string "vehicle_color"
    t.string "vehicle_license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservations", "spots"
  add_foreign_key "reservations", "users"
  add_foreign_key "spots", "users"
end
