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

ActiveRecord::Schema[8.1].define(version: 2026_03_26_055250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "partyable_id", null: false
    t.string "partyable_type", null: false
    t.bigint "property_transaction_id", null: false
    t.datetime "updated_at", null: false
    t.index ["partyable_type", "partyable_id"], name: "index_buyers_on_partyable"
    t.index ["property_transaction_id"], name: "index_buyers_on_property_transaction_id"
  end

  create_table "cdds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "entity_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_cdds_on_entity_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "abn"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  create_table "directors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "individual_id", null: false
    t.bigint "ubo_id", null: false
    t.datetime "updated_at", null: false
    t.index ["individual_id"], name: "index_directors_on_individual_id"
    t.index ["ubo_id"], name: "index_directors_on_ubo_id"
  end

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "entity_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_documents_on_entity_id"
  end

  create_table "entities", force: :cascade do |t|
    t.string "abn"
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.string "first_name"
    t.string "last_name"
    t.string "name"
    t.string "registration_number"
    t.string "risk_rating"
    t.string "status"
    t.string "trust_type"
    t.string "type"
    t.datetime "updated_at", null: false
  end

  create_table "kybs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "entity_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_kybs_on_entity_id"
  end

  create_table "kycs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "entity_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_kycs_on_entity_id"
  end

  create_table "pep_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "entity_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_pep_statuses_on_entity_id"
  end

  create_table "risk_assessments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "entity_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_risk_assessments_on_entity_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "partyable_id", null: false
    t.string "partyable_type", null: false
    t.bigint "property_transaction_id", null: false
    t.datetime "updated_at", null: false
    t.index ["partyable_type", "partyable_id"], name: "index_sellers_on_partyable"
    t.index ["property_transaction_id"], name: "index_sellers_on_property_transaction_id"
  end

  create_table "shareholders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "percentage"
    t.bigint "shareholdable_id", null: false
    t.string "shareholdable_type", null: false
    t.bigint "ubo_id", null: false
    t.datetime "updated_at", null: false
    t.index ["shareholdable_type", "shareholdable_id"], name: "index_shareholders_on_shareholdable"
    t.index ["ubo_id"], name: "index_shareholders_on_ubo_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "partyable_id"
    t.string "partyable_type"
    t.string "property_address"
    t.string "status"
    t.string "type"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["partyable_type", "partyable_id"], name: "index_transactions_on_partyable_type_and_partyable_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "trust_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "individual_id", null: false
    t.string "role"
    t.bigint "trust_id", null: false
    t.datetime "updated_at", null: false
    t.index ["individual_id"], name: "index_trust_roles_on_individual_id"
    t.index ["trust_id"], name: "index_trust_roles_on_trust_id"
  end

  create_table "ubos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "entity_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_ubos_on_entity_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.string "email"
    t.string "role"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
  end

  create_table "vois", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "entity_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_vois_on_entity_id"
  end

  add_foreign_key "buyers", "transactions", column: "property_transaction_id"
  add_foreign_key "cdds", "entities"
  add_foreign_key "directors", "entities", column: "individual_id"
  add_foreign_key "directors", "ubos"
  add_foreign_key "documents", "entities"
  add_foreign_key "kybs", "entities"
  add_foreign_key "kycs", "entities"
  add_foreign_key "pep_statuses", "entities"
  add_foreign_key "risk_assessments", "entities"
  add_foreign_key "sellers", "transactions", column: "property_transaction_id"
  add_foreign_key "shareholders", "ubos"
  add_foreign_key "transactions", "users"
  add_foreign_key "trust_roles", "entities", column: "individual_id"
  add_foreign_key "trust_roles", "entities", column: "trust_id"
  add_foreign_key "ubos", "entities"
  add_foreign_key "users", "companies"
  add_foreign_key "vois", "entities"
end
