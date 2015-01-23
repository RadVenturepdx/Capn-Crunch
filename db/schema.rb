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

ActiveRecord::Schema.define(version: 20150119232618) do

  create_table "guides", force: true do |tableObject|
    tableObject.string   "location"
    tableObject.integer  "user_id"
    tableObject.datetime "created_at",                   null: false
    tableObject.datetime "updated_at",                   null: false
    tableObject.string   "specialty"
    tableObject.float    "rate"
    tableObject.boolean  "availability", default: false
  end

  add_index "guides", ["user_id"], name: "index_guides_on_user_id"

  create_table "users", force: true do |tableObject|
    tableObject.string   "name"
    tableObject.string   "email"
    tableObject.datetime "created_at"
    tableObject.datetime "updated_at"
    tableObject.string   "password_digest"
    tableObject.string   "phone_number"
    tableObject.integer  "age"
    tableObject.text     "profile",         limit: 255
    tableObject.string   "address"
    tableObject.string   "city"
    tableObject.string   "state"
    tableObject.string   "zipcode"
    tableObject.string   "country"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
