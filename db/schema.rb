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

ActiveRecord::Schema.define(version: 20160308163202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menu_property_values", force: :cascade do |t|
    t.integer "menu_id"
    t.integer "property_id"
    t.integer "value"
  end

  create_table "menu_response_elements", force: :cascade do |t|
    t.integer "menu_response_id"
    t.integer "menu_property_value_id"
    t.boolean "accepted"
  end

  create_table "menu_responses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "menu_id"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: :cascade do |t|
    t.string "ref_id"
    t.string "title"
  end

  create_table "properties", force: :cascade do |t|
    t.string "value_type"
    t.string "name"
  end

  create_table "user_profile_elements", force: :cascade do |t|
    t.integer "user_id"
    t.integer "property_id"
    t.string  "value"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
  end

end
