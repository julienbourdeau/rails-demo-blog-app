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

ActiveRecord::Schema[7.1].define(version: 2023_11_08_070906) do
  create_table "authors", charset: "utf8mb4", force: :cascade do |t|
    t.string "full_name", null: false
    t.boolean "distinguished", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_authors", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_post_authors_on_author_id"
    t.index ["post_id"], name: "index_post_authors_on_post_id"
  end

  create_table "posts", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.text "content"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reactions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "post_id"
    t.string "name", null: false
    t.index ["name"], name: "index_reactions_on_name"
    t.index ["post_id"], name: "index_reactions_on_post_id"
  end

end
