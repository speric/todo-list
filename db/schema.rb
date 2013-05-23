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

ActiveRecord::Schema.define(:version => 20130510002429) do

  create_table "items", :force => true do |t|
    t.integer  "user_id",                        :null => false
    t.string   "title",                          :null => false
    t.text     "description"
    t.boolean  "completed",   :default => false, :null => false
    t.integer  "sort_order",  :default => 0
    t.date     "due_date"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "items", ["completed"], :name => "index_items_on_completed"
  add_index "items", ["sort_order"], :name => "index_items_on_sort_order"
  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email_address",       :null => false
    t.string   "persistence_token",   :null => false
    t.string   "single_access_token", :null => false
    t.string   "perishable_token",    :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "users", ["email_address"], :name => "index_users_on_email_address"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
