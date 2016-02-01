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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160130215957) do

  create_table "addresses", :force => true do |t|
    t.text     "address1"
    t.text     "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "postal_code"
    t.string   "country"
    t.string   "address_type"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "subcategories_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "credit_cards", :force => true do |t|
    t.string   "cardholder_name"
    t.integer  "number"
    t.integer  "cvv"
    t.date     "expiration_month"
    t.date     "expiration_year"
    t.date     "expiration_date"
    t.integer  "card_type"
    t.string   "country_of_issuance"
    t.integer  "issuing_bank"
    t.boolean  "debit"
    t.boolean  "prepaid"
    t.string   "options"
    t.integer  "token"
    t.integer  "user_id"
    t.integer  "payment_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "credit_cards", ["payment_id"], :name => "index_credit_cards_on_payment_id"
  add_index "credit_cards", ["user_id"], :name => "index_credit_cards_on_user_id"

  create_table "order_details", :force => true do |t|
    t.integer  "tracking_number"
    t.decimal  "price",           :precision => 5,  :scale => 2
    t.integer  "quantity"
    t.decimal  "discount",        :precision => 10, :scale => 0
    t.decimal  "total",           :precision => 5,  :scale => 2
    t.string   "currency"
    t.integer  "freight"
    t.string   "size"
    t.string   "color"
    t.string   "status"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "order_details", ["order_id"], :name => "index_order_details_on_order_id"
  add_index "order_details", ["product_id"], :name => "index_order_details_on_product_id"

  create_table "orders", :force => true do |t|
    t.datetime "order_date"
    t.datetime "ship_date"
    t.integer  "status"
    t.decimal  "sales_tax",  :precision => 10, :scale => 0
    t.integer  "user_id"
    t.integer  "shipper_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "orders", ["shipper_id"], :name => "index_orders_on_shipper_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "payments", :force => true do |t|
    t.string   "status"
    t.string   "payment_type"
    t.datetime "date"
    t.integer  "user_id"
    t.integer  "credit_card_id"
    t.integer  "order_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "payments", ["credit_card_id"], :name => "index_payments_on_credit_card_id"
  add_index "payments", ["order_id"], :name => "index_payments_on_order_id"
  add_index "payments", ["user_id"], :name => "index_payments_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "quantity_unit"
    t.decimal  "unit_price",         :precision => 5, :scale => 2
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "category_id"
    t.integer  "supplier_id"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"
  add_index "products", ["supplier_id"], :name => "index_products_on_supplier_id"

  create_table "shippers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "last_name"
    t.integer  "phone"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
