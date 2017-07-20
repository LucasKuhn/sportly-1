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

ActiveRecord::Schema.define(version: 20170623093238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approvals", force: :cascade do |t|
    t.string   "status"
    t.integer  "approver_id"
    t.integer  "approvable_id"
    t.string   "approvable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "confirmations", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.datetime "date"
    t.string   "location"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name",             null: false
    t.integer  "manager_id"
    t.integer  "players_per_team"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "date"
    t.string   "location"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "team1confirmations", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team2confirmations", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "captain_id"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",        null: false
    t.string   "last_name",         null: false
    t.string   "email",             null: false
    t.string   "password_hash"
    t.integer  "primary_team_id"
    t.integer  "secondary_team_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
