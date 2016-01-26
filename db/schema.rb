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

ActiveRecord::Schema.define(:version => 20160126204420) do

  create_table "addresses", :force => true do |t|
    t.text     "address1"
    t.text     "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "postal_code"
    t.string   "country"
    t.integer  "address_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "order_details", :force => true do |t|
    t.integer  "tracking_number"
    t.decimal  "price",           :precision => 10, :scale => 0
    t.integer  "quantity"
    t.decimal  "discount",        :precision => 10, :scale => 0
    t.decimal  "total",           :precision => 10, :scale => 0
    t.integer  "currency"
    t.integer  "size"
    t.integer  "color"
    t.integer  "status"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "tracking_number"
    t.datetime "order_date"
    t.datetime "ship_date"
    t.integer  "status"
    t.integer  "freight"
    t.decimal  "sales_tax",       :precision => 10, :scale => 0
    t.integer  "order_id"
    t.integer  "user_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "orders", ["order_id"], :name => "index_orders_on_order_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "payments", :force => true do |t|
    t.integer  "status"
    t.integer  "payment_type"
    t.datetime "date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

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
    t.string   "email"
    t.string   "password"
    t.integer  "phone"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
