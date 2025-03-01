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

ActiveRecord::Schema[7.0].define(version: 2024_04_05_140351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "creations", force: :cascade do |t|
    t.string "nom"
    t.text "description"
    t.string "photos"
    t.string "date"
    t.string "logiciel"
    t.string "poste_occupe"
    t.string "entreprise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "creation_type"
    t.string "format"
    t.string "image_paths"
  end

  create_table "messages", force: :cascade do |t|
    t.string "nom"
    t.string "email"
    t.string "sujet"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
