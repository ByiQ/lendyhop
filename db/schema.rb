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

ActiveRecord::Schema.define(version: 20160725200651) do

  create_table "availabilities", force: :cascade do |t|
    t.integer "item_id",     null: false
    t.string  "cron_string", null: false
  end

  add_index "availabilities", ["item_id"], name: "index_availabilities_on_item_id"

  create_table "checkouts", force: :cascade do |t|
    t.integer "item_id",           null: false
    t.integer "user_id",           null: false
    t.string  "checkout_time_out", null: false
    t.string  "checkout_time_in",  null: false
  end

  add_index "checkouts", ["item_id"], name: "index_checkouts_on_item_id"
  add_index "checkouts", ["user_id"], name: "index_checkouts_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "user_id", null: false
    t.string  "comment", null: false
  end

  add_index "comments", ["item_id"], name: "index_comments_on_item_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "items", force: :cascade do |t|
    t.integer "user_id",     null: false
    t.string  "title",       null: false
    t.string  "description", null: false
    t.string  "price",       null: false
    t.string  "location",    null: false
    t.string  "condition",   null: false
    t.string  "status",      null: false
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string  "tag",     null: false
  end

  add_index "tags", ["item_id"], name: "index_tags_on_item_id"

  create_table "users", force: :cascade do |t|
    t.string  "firstname", null: false
    t.string  "lastname",  null: false
    t.string  "user_name", null: false
    t.string  "address",   null: false
    t.integer "phone",     null: false
  end

end
