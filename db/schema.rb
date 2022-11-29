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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_065649) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "country_code"
    t.text "description"
    t.string "founding_year"
    t.string "spacecraft"
    t.string "image_url"
    t.string "logo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agency_type"
  end

  create_table "astronauts", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "agency"
    t.string "profile_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.string "news_url"
    t.string "video_url"
    t.string "feature_image"
    t.datetime "date"
    t.string "event_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "launches", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "status_desc"
    t.datetime "window_start"
    t.datetime "window_end"
    t.decimal "probability"
    t.string "agenc"
    t.string "rocket"
    t.string "mission"
    t.string "mission_desc"
    t.string "pad"
    t.string "pad_lat"
    t.string "pad_lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
