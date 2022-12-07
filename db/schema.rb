# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_07_010659) do
  create_table "goals", force: :cascade do |t|
    t.string "content"
    t.integer "complete"
    t.string "complete_by"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guesses", force: :cascade do |t|
    t.string "abc"
    t.float "accuracy"
    t.integer "user_id", null: false
    t.integer "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_guesses_on_user_id"
  end

  create_table "individual_stats", force: :cascade do |t|
    t.integer "user_id"
    t.integer "song_id"
    t.integer "number_of_plays"
    t.integer "number_of_guesses"
    t.integer "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "practices", force: :cascade do |t|
    t.string "name"
    t.string "first"
    t.string "second"
    t.string "third"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.string "artist"
    t.string "key_signature"
    t.string "time_signature"
    t.string "abc_notation"
    t.string "info"
    t.integer "user_id"
    t.integer "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "streak"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "guesses", "users"
end
