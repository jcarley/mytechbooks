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

ActiveRecord::Schema.define(version: 20141208223848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "ean"
    t.string   "isbn"
    t.integer  "pages"
    t.string   "binding"
    t.integer  "edition"
    t.string   "formatted_price"
    t.string   "asin"
    t.string   "amount"
    t.string   "details_url"
    t.text     "description"
    t.string   "small_img_url"
    t.string   "medium_img_url"
    t.string   "large_img_url"
    t.string   "publisher"
    t.date     "published_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "command_sources", force: true do |t|
    t.integer  "user_id"
    t.string   "class_type", limit: 125
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "elapsed"
  end

  add_index "command_sources", ["class_type"], name: "index_command_sources_on_class_type", using: :btree
  add_index "command_sources", ["user_id"], name: "index_command_sources_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "aggregate_uid"
  end

  add_index "events", ["aggregate_uid"], name: "index_events_on_aggregate_uid", using: :btree
  add_index "events", ["name"], name: "index_events_on_name", using: :btree

end
