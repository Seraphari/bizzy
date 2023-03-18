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

ActiveRecord::Schema[7.0].define(version: 2023_03_17_140012) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "founder_sectors", force: :cascade do |t|
    t.bigint "founder_id", null: false
    t.bigint "sector_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["founder_id"], name: "index_founder_sectors_on_founder_id"
    t.index ["sector_id"], name: "index_founder_sectors_on_sector_id"
  end

  create_table "founders", force: :cascade do |t|
    t.string "company_name"
    t.text "company_description"
    t.string "company_email"
    t.string "company_UEN"
    t.string "funding_stage"
    t.date "date_incorporated"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_founders_on_user_id"
  end

  create_table "investor_sectors", force: :cascade do |t|
    t.bigint "investor_id", null: false
    t.bigint "sector_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investor_id"], name: "index_investor_sectors_on_investor_id"
    t.index ["sector_id"], name: "index_investor_sectors_on_sector_id"
  end

  create_table "investors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.text "company_description"
    t.string "company_email"
    t.string "company_UEN"
    t.string "funding_stage"
    t.string "ticket_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "founder_sectors", "founders"
  add_foreign_key "founder_sectors", "sectors"
  add_foreign_key "founders", "users"
  add_foreign_key "investor_sectors", "investors"
  add_foreign_key "investor_sectors", "sectors"
end
