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

ActiveRecord::Schema.define(version: 20201116013618) do

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.text     "tags"
    t.integer  "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cards", ["name", "deck_id"], name: "index_cards_on_name_and_deck_id", unique: true

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "decks", ["name", "user_id"], name: "index_decks_on_name_and_user_id", unique: true

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
