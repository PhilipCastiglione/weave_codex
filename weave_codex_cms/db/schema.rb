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

ActiveRecord::Schema[7.1].define(version: 2024_02_23_071509) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "biomes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "map_region"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "species_id", null: false
    t.integer "domain_id", null: false
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_id"], name: "index_characters_on_domain_id"
    t.index ["organization_id"], name: "index_characters_on_organization_id"
    t.index ["species_id"], name: "index_characters_on_species_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "population"
    t.integer "domain_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "map_region"
    t.index ["domain_id"], name: "index_cities_on_domain_id"
  end

  create_table "cities_organizations", id: false, force: :cascade do |t|
    t.integer "city_id", null: false
    t.integer "organization_id", null: false
    t.index ["city_id", "organization_id"], name: "index_cities_organizations_on_city_id_and_organization_id"
    t.index ["organization_id", "city_id"], name: "index_cities_organizations_on_organization_id_and_city_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "map_region"
  end

  create_table "domains_species", id: false, force: :cascade do |t|
    t.integer "domain_id", null: false
    t.integer "species_id", null: false
    t.index ["domain_id", "species_id"], name: "index_domains_species_on_domain_id_and_species_id"
    t.index ["species_id", "domain_id"], name: "index_domains_species_on_species_id_and_domain_id"
  end

  create_table "fauna", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "diet"
    t.string "habitat"
    t.string "threat_model"
    t.string "map_region"
  end

  create_table "flora", force: :cascade do |t|
    t.string "name"
    t.string "habitat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "map_region"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "classification"
    t.integer "membership_numbers"
    t.integer "domain_id", null: false
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "map_region"
    t.index ["domain_id"], name: "index_organizations_on_domain_id"
    t.index ["parent_id"], name: "index_organizations_on_parent_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "diet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "characters", "domains"
  add_foreign_key "characters", "organizations"
  add_foreign_key "characters", "species"
  add_foreign_key "cities", "domains"
  add_foreign_key "organizations", "domains"
  add_foreign_key "organizations", "organizations", column: "parent_id"
end
