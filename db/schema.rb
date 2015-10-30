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

ActiveRecord::Schema.define(version: 20151030001729) do

  create_table "events", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "execute_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "event_id",       limit: 4
    t.datetime "coordinated_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "groups", ["event_id"], name: "index_groups_on_event_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.integer  "group_id",   limit: 4
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id", using: :btree

  add_foreign_key "groups", "events"
  add_foreign_key "members", "groups"
end
