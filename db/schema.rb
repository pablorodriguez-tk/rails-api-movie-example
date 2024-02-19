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

ActiveRecord::Schema[7.1].define(version: 2024_02_19_122048) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "gender"
    t.date "release_date"
    t.integer "qualification"
    t.bigint "director_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director_id"], name: "index_movies_on_director_id"
  end

  create_table "movies_users", id: false, force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string "format"
    t.string "path"
    t.string "duration"
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_sources_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.integer "document_type"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "movies", "users", column: "director_id"
  add_foreign_key "sources", "movies"
end
