# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150306214304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guides", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "rate"
    t.string   "sun_avail"
    t.string   "mon_avail"
    t.string   "tues_avail"
    t.string   "wed_avail"
    t.string   "thurs_avail"
    t.string   "fri_avail"
    t.string   "sat_avail"
    t.boolean  "hood"
    t.boolean  "bachelor"
    t.boolean  "whistler"
    t.boolean  "downhill"
    t.boolean  "crosscountry"
    t.boolean  "snowboard"
    t.text     "profile"
  end

  add_index "guides", ["user_id"], name: "index_guides_on_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.integer  "user_id"
    t.integer  "guide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time"
    t.integer  "number_of_people"
    t.string   "note"
    t.string   "location"
    t.string   "payment_status"
    t.float    "price"
  end

  add_index "reservations", ["guide_id", "created_at"], name: "index_reservations_on_guide_id_and_created_at", using: :btree
  add_index "reservations", ["guide_id"], name: "index_reservations_on_guide_id", using: :btree
  add_index "reservations", ["user_id", "created_at"], name: "index_reservations_on_user_id_and_created_at", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "reviews", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "guide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
    t.string   "title"
  end

  add_index "reviews", ["guide_id", "created_at"], name: "index_reviews_on_guide_id_and_created_at", using: :btree
  add_index "reviews", ["guide_id"], name: "index_reviews_on_guide_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "phone_number"
    t.integer  "age"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
