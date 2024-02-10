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

ActiveRecord::Schema[7.2].define(version: 2024_02_10_193325) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airdrops", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "tx_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_airdrops_on_user_id"
  end

  create_table "app_settings", force: :cascade do |t|
    t.integer "casts_last_processed_timestamp"
    t.boolean "casts_processing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "cast"
    t.bigint "caster_id"
    t.bigint "transfer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transfer_id"], name: "index_bookmarks_on_transfer_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "amount"
    t.decimal "readable_amount", precision: 28, scale: 18
    t.string "tx_hash"
    t.string "block_number"
    t.string "status"
    t.bigint "caster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["caster_id"], name: "index_transfers_on_caster_id"
    t.index ["user_id"], name: "index_transfers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "fid"
    t.string "address"
    t.bigint "balance"
    t.decimal "readable_balance", precision: 28, scale: 18
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "airdrops", "users"
  add_foreign_key "bookmarks", "transfers"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "transfers", "users"
  add_foreign_key "transfers", "users", column: "caster_id"
end
