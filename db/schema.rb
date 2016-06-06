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

ActiveRecord::Schema.define(version: 20160606124845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffee_consumptions", force: :cascade do |t|
    t.datetime "date"
    t.integer  "caffine_in_mg"
    t.integer  "coffee_type_id"
    t.integer  "size"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "coffee_consumptions", ["coffee_type_id"], name: "index_coffee_consumptions_on_coffee_type_id", using: :btree

  create_table "coffee_notes", force: :cascade do |t|
    t.datetime "date"
    t.string   "coffee_type"
    t.integer  "rating"
    t.text     "notes"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "coffee_type_id"
    t.integer  "coffee_consumption_id"
  end

  add_index "coffee_notes", ["coffee_consumption_id"], name: "index_coffee_notes_on_coffee_consumption_id", using: :btree
  add_index "coffee_notes", ["coffee_type_id"], name: "index_coffee_notes_on_coffee_type_id", using: :btree

  create_table "coffee_types", force: :cascade do |t|
    t.string   "name"
    t.text     "recipe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "coffee_consumptions", "coffee_types"
  add_foreign_key "coffee_notes", "coffee_consumptions"
  add_foreign_key "coffee_notes", "coffee_types"
end
