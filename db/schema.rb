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

ActiveRecord::Schema.define(version: 2019_10_18_185917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: :cascade do |t|
    t.boolean "liked"
    t.bigint "swiper_id"
    t.bigint "swiped_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["swiped_id"], name: "index_likes_on_swiped_id"
    t.index ["swiper_id"], name: "index_likes_on_swiper_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "user_one_id"
    t.bigint "user_two_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_one_id"], name: "index_matches_on_user_one_id"
    t.index ["user_two_id"], name: "index_matches_on_user_two_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "sent"
    t.text "received"
    t.bigint "matches_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matches_id"], name: "index_messages_on_matches_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.text "description"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_portfolios_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.text "bio"
    t.text "skills", default: [], array: true
    t.text "interests", default: [], array: true
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.bigint "location_id"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["location_id"], name: "index_users_on_location_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "likes", "users"
  add_foreign_key "likes", "users", column: "swiped_id"
  add_foreign_key "likes", "users", column: "swiper_id"
  add_foreign_key "matches", "users", column: "user_one_id"
  add_foreign_key "matches", "users", column: "user_two_id"
  add_foreign_key "messages", "matches", column: "matches_id"
  add_foreign_key "portfolios", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "users", "locations"
end
