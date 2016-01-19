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

ActiveRecord::Schema.define(:version => 20160119194102) do

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.string   "status"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "invoices", ["user_id"], :name => "index_invoices_on_user_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.decimal  "price",         :precision => 5, :scale => 2
    t.text     "description"
    t.integer  "supplier_id"
    t.integer  "user_id"
    t.integer  "department_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "items", ["department_id"], :name => "index_items_on_department_id"
  add_index "items", ["supplier_id"], :name => "index_items_on_supplier_id"
  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "suppliers", ["item_id"], :name => "index_suppliers_on_item_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.integer  "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
