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

ActiveRecord::Schema[8.1].define(version: 2026_02_02_061316) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "company_number"
    t.datetime "created_at", null: false
    t.string "docs_s3_folder"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "kybs", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_kybs_on_company_id"
  end

  create_table "kycs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "natural_person_id", null: false
    t.datetime "updated_at", null: false
    t.index ["natural_person_id"], name: "index_kycs_on_natural_person_id"
  end

  create_table "lead_entities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "entity_id"
    t.string "entity_type"
    t.string "lead_entity_kind"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_lead_entities_on_entity"
  end

  create_table "natural_people", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "dob"
    t.string "docs_s3_folder"
    t.string "first_name"
    t.string "last_name"
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "charge_status"
    t.datetime "created_at", null: false
    t.bigint "lead_entity_id", null: false
    t.decimal "price"
    t.string "status"
    t.datetime "transaction_date"
    t.datetime "updated_at", null: false
    t.index ["lead_entity_id"], name: "index_transactions_on_lead_entity_id"
  end

  create_table "vois", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "natural_person_id", null: false
    t.datetime "updated_at", null: false
    t.index ["natural_person_id"], name: "index_vois_on_natural_person_id"
  end

  add_foreign_key "kybs", "companies"
  add_foreign_key "kycs", "natural_people"
  add_foreign_key "transactions", "lead_entities"
  add_foreign_key "vois", "natural_people"
end
