# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_11_171327) do

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "party_relationship_types", force: :cascade do |t|
    t.integer "from_role_id", null: false
    t.integer "to_role_id", null: false
    t.string "description"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_role_id"], name: "index_party_relationship_types_on_from_role_id"
    t.index ["to_role_id"], name: "index_party_relationship_types_on_to_role_id"
  end

  create_table "party_relationships", force: :cascade do |t|
    t.integer "from_role_id", null: false
    t.integer "to_role_id", null: false
    t.date "thru_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_role_id"], name: "index_party_relationships_on_from_role_id"
    t.index ["to_role_id"], name: "index_party_relationships_on_to_role_id"
  end

  create_table "party_roles", force: :cascade do |t|
    t.integer "party_id", null: false
    t.integer "role_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["party_id"], name: "index_party_roles_on_party_id"
    t.index ["role_type_id"], name: "index_party_roles_on_role_type_id"
  end

  create_table "role_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "party_relationship_types", "role_types", column: "from_role_id"
  add_foreign_key "party_relationship_types", "role_types", column: "to_role_id"
  add_foreign_key "party_relationships", "party_roles", column: "from_role_id"
  add_foreign_key "party_relationships", "party_roles", column: "to_role_id"
  add_foreign_key "party_roles", "parties"
  add_foreign_key "party_roles", "role_types"
end
