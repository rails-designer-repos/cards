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

ActiveRecord::Schema[8.0].define(version: 2025_10_06_042706) do
  create_table "board_cards", force: :cascade do |t|
    t.integer "board_column_id", null: false
    t.string "resource_type", null: false
    t.integer "resource_id", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_column_id", "position"], name: "index_board_cards_on_board_column_id_and_position", unique: true
    t.index ["board_column_id"], name: "index_board_cards_on_board_column_id"
    t.index ["resource_type", "resource_id"], name: "index_board_cards_on_resource"
  end

  create_table "board_columns", force: :cascade do |t|
    t.integer "board_id", null: false
    t.string "name", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id", "position"], name: "index_board_columns_on_board_id_and_position", unique: true
    t.index ["board_id"], name: "index_board_columns_on_board_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "board_cards", "board_columns"
  add_foreign_key "board_columns", "boards"
end
