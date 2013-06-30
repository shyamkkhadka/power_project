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

ActiveRecord::Schema.define(:version => 20130630052317) do

  create_table "accounting_offices", :force => true do |t|
    t.string   "name"
    t.integer  "regional_directorate_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "batteries", :force => true do |t|
    t.integer  "system_type_id"
    t.string   "company_name"
    t.integer  "bank_no"
    t.integer  "capacity"
    t.date     "installation_date"
    t.date     "fist_installation_date"
    t.string   "installation_team"
    t.text     "remarks"
    t.integer  "station_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "battery_daily_tests", :force => true do |t|
    t.integer  "battery_id"
    t.string   "total_voltage"
    t.text     "visual_inspection"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "battery_weekly_tests", :force => true do |t|
    t.string   "cell_voltage"
    t.integer  "battery_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "rectifiers", :force => true do |t|
    t.integer  "system_type_id"
    t.string   "manufacturer_name"
    t.string   "serial_no"
    t.integer  "module_no"
    t.integer  "total_capacity"
    t.date     "first_installation_date"
    t.string   "installation_team"
    t.text     "remarks"
    t.integer  "station_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.date     "installation_date"
  end

  create_table "regional_directorates", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "city"
    t.string   "zone"
    t.string   "district"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "station_users", :id => false, :force => true do |t|
    t.integer "station_id"
    t.integer "user_id"
  end

  create_table "stations", :force => true do |t|
    t.string   "name"
    t.string   "inc_name"
    t.integer  "inc_cell"
    t.string   "inc_address"
    t.text     "remarks"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "regional_directorate_id"
    t.integer  "accounting_office_id"
  end

  create_table "stations_users", :id => false, :force => true do |t|
    t.integer "station_id"
    t.integer "user_id"
  end

  create_table "system_type", :force => true do |t|
    t.string "name"
  end

  create_table "system_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
