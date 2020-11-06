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

ActiveRecord::Schema.define(version: 2020_11_06_074831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "brand"
    t.integer "amount"
    t.time "time"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "general_healths", force: :cascade do |t|
    t.datetime "date"
    t.integer "weight"
    t.string "energy_level"
    t.string "hunger_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "extra"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.string "use"
    t.time "time"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dosage"
  end

  create_table "treats", force: :cascade do |t|
    t.string "treat_type"
    t.integer "amount"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_treats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "breed"
    t.integer "goal_weight"
    t.integer "current_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date_of_birth"
  end

  create_table "walks", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "foods", "users"
  add_foreign_key "treats", "users"
end
