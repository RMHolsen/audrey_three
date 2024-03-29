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

ActiveRecord::Schema.define(version: 20210518184858) do

  create_table "item_sources", force: :cascade do |t|
    t.integer "source_id"
    t.integer "item_id"
    t.index ["item_id"], name: "index_item_sources_on_item_id"
    t.index ["source_id"], name: "index_item_sources_on_source_id"
  end

  create_table "items", force: :cascade do |t|
    t.string  "name"
    t.string  "material"
    t.string  "creator"
    t.integer "publication_date"
    t.integer "list_id"
    t.index ["list_id"], name: "index_items_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.boolean  "public",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "summary"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "genre"
    t.integer  "user_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string  "name"
    t.string  "location"
    t.string  "contact"
    t.boolean "fee",         default: true
    t.string  "hours"
    t.text    "description"
  end

  create_table "topics", force: :cascade do |t|
    t.string  "name"
    t.integer "project_id"
    t.integer "list_id"
    t.index ["list_id"], name: "index_topics_on_list_id"
    t.index ["project_id"], name: "index_topics_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "profile"
    t.string "password_digest"
    t.string "display_name"
  end

end
