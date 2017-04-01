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

ActiveRecord::Schema.define(version: 20170401033331) do

  create_table "sports", force: :cascade do |t|
    t.string   "title"
    t.string   "winner"
    t.string   "loser"
    t.string   "wp"
    t.string   "lp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "teamone"
    t.string   "teamtwo"
    t.string   "status"
    t.string   "hour"
    t.string   "minute"
    t.string   "week"
    t.string   "wday"
    t.string   "place"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "points"
    t.string   "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
