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

ActiveRecord::Schema[7.0].define(version: 2023_05_01_230127) do
  create_table "bikes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "identifier"
    t.integer "current_station_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "battery_charge"
    t.integer "status"
  end

  create_table "rentals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "bike_id", null: false
    t.bigint "user_id", null: false
    t.integer "start_station_id"
    t.integer "end_station_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id", "user_id"], name: "index_rentals_on_bike_id_and_user_id"
    t.index ["bike_id"], name: "index_rentals_on_bike_id"
    t.index ["user_id", "bike_id"], name: "index_rentals_on_user_id_and_bike_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "stations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "identifier"
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_kiosk"
    t.boolean "needs_maintenance"
    t.integer "dock_count"
    t.integer "docked_bike_count"
    t.string "bikes_at_station"
    t.boolean "is_full"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "address"
    t.string "phone_number"
    t.date "date_birth"
    t.decimal "credit", precision: 10
    t.string "first_name"
    t.string "last_name"
  end

  add_foreign_key "rentals", "bikes"
  add_foreign_key "rentals", "users"
end
