# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160417004524) do

  create_table "contact_phone_numbers", force: :cascade do |t|
    t.string "type",            limit: 64,  null: false
    t.string "contact_id",      limit: 255, null: false
    t.string "phone_number_id", limit: 255, null: false
    t.string "status",          limit: 32,  null: false
  end

  add_index "contact_phone_numbers", ["contact_id"], name: "index_contact_phone_numbers_on_contact_id", using: :btree
  add_index "contact_phone_numbers", ["phone_number_id"], name: "index_contact_phone_numbers_on_phone_number_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string "name",    limit: 255, null: false
    t.string "surname", limit: 255, null: false
  end

  add_index "contacts", ["surname", "name"], name: "index_contacts_on_surname_and_name", using: :btree

  create_table "credit_cards", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "first_name",       limit: 255
    t.string   "last_name",        limit: 255
    t.string   "number",           limit: 255
    t.string   "address_line_1",   limit: 255
    t.string   "address_line_2",   limit: 255
    t.string   "city",             limit: 255
    t.string   "country",          limit: 255
    t.string   "zipcode",          limit: 255
    t.string   "state",            limit: 255
    t.string   "expiration_month", limit: 255
    t.string   "expiration_year",  limit: 255
    t.string   "cvv",              limit: 255
  end

  add_index "credit_cards", ["user_id"], name: "index_credit_cards_on_user_id", using: :btree

  create_table "debits", force: :cascade do |t|
    t.integer  "user_id",                limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "transaction_identifier", limit: 255
    t.string   "amount",                 limit: 255
  end

  add_index "debits", ["user_id"], name: "index_debits_on_user_id", using: :btree

  create_table "exchange_locations", force: :cascade do |t|
    t.integer "exchange_id", limit: 4,  null: false
    t.integer "location_id", limit: 4,  null: false
    t.string  "status",      limit: 32, null: false
  end

  add_index "exchange_locations", ["exchange_id"], name: "index_exchange_locations_on_exchange_id", using: :btree
  add_index "exchange_locations", ["location_id"], name: "index_exchange_locations_on_location_id", using: :btree

  create_table "exchanges", force: :cascade do |t|
    t.integer "beneficiary_id",         limit: 4,   null: false
    t.integer "courier_id",             limit: 4,   null: false
    t.integer "request_id",             limit: 4,   null: false
    t.string  "status",                 limit: 32,  null: false
    t.string  "amount",                 limit: 255
    t.string  "transaction_identifier", limit: 255
    t.string  "surcharge",              limit: 255
  end

  add_index "exchanges", ["beneficiary_id"], name: "index_exchanges_on_beneficiary_id", using: :btree
  add_index "exchanges", ["courier_id"], name: "index_exchanges_on_courier_id", using: :btree
  add_index "exchanges", ["request_id"], name: "index_exchanges_on_request_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string  "city",          limit: 64, null: false
    t.string  "country",       limit: 2,  null: false
    t.string  "state_code",    limit: 2
    t.integer "zip_5",         limit: 4
    t.integer "zip_4",         limit: 4
    t.integer "latitude",      limit: 4
    t.integer "longitude",     limit: 4
    t.integer "google_map_id", limit: 4
  end

  add_index "locations", ["latitude"], name: "index_locations_on_latitude", using: :btree
  add_index "locations", ["longitude"], name: "index_locations_on_longitude", using: :btree
  add_index "locations", ["state_code"], name: "index_locations_on_state_code", using: :btree
  add_index "locations", ["zip_5", "zip_4"], name: "index_locations_on_zip_5_and_zip_4", using: :btree

  create_table "long_strings", force: :cascade do |t|
    t.string  "describable_type", limit: 64
    t.integer "describable_id",   limit: 4,     null: false
    t.string  "attribute_name",   limit: 255,   null: false
    t.text    "content",          limit: 65535
  end

  add_index "long_strings", ["describable_id", "attribute_name"], name: "index_long_strings_on_describable_id_and_attribute_name", using: :btree

  create_table "packages", force: :cascade do |t|
    t.integer "exchange_id", limit: 4,  null: false
    t.integer "request_id",  limit: 4,  null: false
    t.string  "status",      limit: 32, null: false
  end

  add_index "packages", ["exchange_id"], name: "index_packages_on_exchange_id", using: :btree
  add_index "packages", ["request_id"], name: "index_packages_on_request_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer "exchange_id", limit: 4,                          null: false
    t.decimal "amount",                precision: 14, scale: 2, null: false
  end

  add_index "payments", ["exchange_id"], name: "index_payments_on_exchange_id", unique: true, using: :btree

  create_table "phone_numbers", force: :cascade do |t|
    t.string "country_code",      limit: 255
    t.string "area_code",         limit: 3
    t.string "subscriber_number", limit: 255, null: false
  end

  add_index "phone_numbers", ["area_code", "subscriber_number", "country_code"], name: "main_idx", unique: true, using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "beneficiary_id", limit: 4,  null: false
    t.integer  "requestor_id",   limit: 4,  null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status",         limit: 32, null: false
  end

  add_index "requests", ["start_date", "end_date"], name: "index_requests_on_start_date_and_end_date", using: :btree

  create_table "travel_plans", force: :cascade do |t|
    t.integer  "courier_id",  limit: 4,   null: false
    t.datetime "start_time",              null: false
    t.datetime "end_time"
    t.datetime "start_date",              null: false
    t.datetime "end_date"
    t.string   "destination", limit: 255, null: false
  end

  add_index "travel_plans", ["start_date", "end_date"], name: "index_travel_plans_on_start_date_and_end_date", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "contact_id",             limit: 4,                null: false
    t.string   "status",                 limit: 32,               null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["contact_id"], name: "index_users_on_contact_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "credit_cards", "users"
  add_foreign_key "debits", "users"
end
