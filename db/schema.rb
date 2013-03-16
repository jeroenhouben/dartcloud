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

ActiveRecord::Schema.define(version: 20130316115014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leg_players", id: false, force: true do |t|
    t.uuid "id",        null: false
    t.uuid "player_id", null: false
    t.uuid "leg_id",    null: false
  end

  create_table "legs", id: false, force: true do |t|
    t.uuid "id",        null: false
    t.uuid "match_id",  null: false
    t.uuid "winner_id"
  end

  create_table "match_players", id: false, force: true do |t|
    t.uuid "id",        null: false
    t.uuid "match_id",  null: false
    t.uuid "player_id", null: false
  end

  create_table "matches", id: false, force: true do |t|
    t.uuid    "id",          null: false
    t.integer "start_score", null: false
  end

  create_table "players", id: false, force: true do |t|
    t.uuid   "id",   null: false
    t.string "name", null: false
  end

  create_table "turns", id: false, force: true do |t|
    t.uuid    "id",                            null: false
    t.uuid    "leg_player_id",                 null: false
    t.integer "dart1"
    t.integer "dart2"
    t.integer "dart3"
    t.boolean "completed",     default: false, null: false
    t.integer "simple_score"
  end

end
