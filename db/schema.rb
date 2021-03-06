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

ActiveRecord::Schema.define(version: 20140809125549) do

  create_table "matrices", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max"
    t.integer  "min"
  end

  create_table "paired_days", force: true do |t|
    t.date     "date"
    t.integer  "person_id"
    t.integer  "pair_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paired_days", ["pair_id"], name: "index_paired_days_on_pair_id", using: :btree
  add_index "paired_days", ["person_id"], name: "index_paired_days_on_person_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "name"
    t.integer  "joker"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
