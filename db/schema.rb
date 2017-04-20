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

ActiveRecord::Schema.define(version: 20170419215243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "agent_actions", force: :cascade do |t|
    t.string   "image_link"
    t.string   "title"
    t.boolean  "performed",  default: false
    t.boolean  "ignored",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "user_logs", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "note"
    t.string   "browser"
    t.string   "ip_address"
    t.string   "controller"
    t.string   "action"
    t.string   "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_logs", ["user_id"], name: "index_user_logs_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
