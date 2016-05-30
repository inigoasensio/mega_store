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

ActiveRecord::Schema.define(version: 20160528093508) do

  create_table "addresses", force: :cascade do |t|
    t.text     "address1",         limit: 65535
    t.text     "address2",         limit: 65535
    t.string   "city",             limit: 255
    t.string   "state",            limit: 255
    t.integer  "postal_code",      limit: 4
    t.string   "country",          limit: 255
    t.string   "address_type",     limit: 255
    t.boolean  "default",          limit: 1
    t.integer  "addressable_id",   limit: 4
    t.string   "addressable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "parent_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string   "cardholder_name",     limit: 255
    t.integer  "number",              limit: 4
    t.integer  "cvv",                 limit: 4
    t.date     "expiration_month"
    t.date     "expiration_year"
    t.date     "expiration_date"
    t.integer  "card_type",           limit: 4
    t.string   "country_of_issuance", limit: 255
    t.integer  "issuing_bank",        limit: 4
    t.boolean  "debit",               limit: 1
    t.boolean  "prepaid",             limit: 1
    t.string   "options",             limit: 255
    t.integer  "token",               limit: 4
    t.integer  "user_id",             limit: 4
    t.integer  "purchase_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_cards", ["purchase_id"], name: "index_credit_cards_on_purchase_id", using: :btree
  add_index "credit_cards", ["user_id"], name: "index_credit_cards_on_user_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.string   "status",      limit: 255
    t.integer  "quantity",    limit: 4
    t.decimal  "unit_price",              precision: 5,  scale: 2
    t.decimal  "total_price",             precision: 5,  scale: 2
    t.string   "currency",    limit: 255
    t.decimal  "discount",                precision: 10
    t.integer  "freight",     limit: 4
    t.integer  "length",      limit: 4
    t.integer  "width",       limit: 4
    t.integer  "height",      limit: 4
    t.integer  "order_id",    limit: 4
    t.integer  "product_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.datetime "order_date"
    t.string   "status",          limit: 255
    t.datetime "shipping_date"
    t.string   "shipping_status", limit: 255
    t.integer  "tracking_number", limit: 4
    t.decimal  "sales_tax",                   precision: 10
    t.integer  "user_id",         limit: 4
    t.integer  "shipper_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["shipper_id"], name: "index_orders_on_shipper_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.integer  "sku",                limit: 4
    t.integer  "barcode",            limit: 4
    t.integer  "weight",             limit: 4
    t.string   "size",               limit: 255
    t.string   "color",              limit: 255
    t.decimal  "price",                            precision: 5, scale: 2
    t.date     "voided_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "category_id",        limit: 4
    t.integer  "supplier_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["supplier_id"], name: "index_products_on_supplier_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.string   "status",         limit: 255
    t.string   "purchase_type",  limit: 255
    t.datetime "purchase_date"
    t.integer  "user_id",        limit: 4
    t.integer  "credit_card_id", limit: 4
    t.integer  "order_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["credit_card_id"], name: "index_purchases_on_credit_card_id", using: :btree
  add_index "purchases", ["order_id"], name: "index_purchases_on_order_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "shippers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transfers", force: :cascade do |t|
    t.datetime "expected_date"
    t.string   "status",        limit: 255
    t.integer  "product_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "transfers", ["product_id"], name: "index_transfers_on_product_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.integer  "phone",                  limit: 4
    t.boolean  "supplier",               limit: 1,   default: false
    t.boolean  "admin",                  limit: 1,   default: false
    t.boolean  "super_admin",            limit: 1,   default: false
    t.string   "braintree_customer_id",  limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
