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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120411024321) do

  create_table "fantasy_players", :force => true do |t|
    t.integer  "owner_id",   :null => false
    t.integer  "player_id",  :null => false
    t.integer  "status"
    t.integer  "week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fantasy_players", ["owner_id"], :name => "index_fantasy_players_on_owner_id"
  add_index "fantasy_players", ["player_id"], :name => "index_fantasy_players_on_player_id"

  create_table "games", :force => true do |t|
    t.integer  "home_team_id", :null => false
    t.integer  "away_team_id", :null => false
    t.integer  "home_score"
    t.integer  "away_score"
    t.date     "date"
    t.integer  "week",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "number"
    t.string   "name",             :null => false
    t.string   "school"
    t.integer  "ultimate_team_id", :null => false
    t.integer  "height"
    t.integer  "weight"
    t.string   "club_team"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["ultimate_team_id"], :name => "index_players_on_ultimate_team_id"

  create_table "stats", :force => true do |t|
    t.integer  "player_id",  :null => false
    t.integer  "game_id",    :null => false
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "ds"
    t.integer  "turns"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["game_id"], :name => "index_stats_on_game_id"
  add_index "stats", ["player_id"], :name => "index_stats_on_player_id"

  create_table "ultimate_teams", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
