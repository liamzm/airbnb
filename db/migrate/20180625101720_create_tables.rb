class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|

   	create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "check_in_date"
    t.date "check_out_date"
    t.bigint "user_id"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "payment_status", default: false
    t.index ["property_id"], name: "index_bookings_on_property_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "address", null: false
    t.string "city", null: false
    t.integer "price_per_night", null: false
    t.bigint "user_id"
    t.boolean "verification"
    t.boolean "verified_status", default: false
    t.json "images"
    t.string "name"
    t.integer "bedrooms"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "reservations_tables", force: :cascade do |t|
    t.date "check_in_date"
    t.date "check_out_date"
    t.bigint "user_id"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_reservations_tables_on_property_id"
    t.index ["user_id"], name: "index_reservations_tables_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.integer "phone"
    t.integer "user_type", default: 0
    t.string "image"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
end
end