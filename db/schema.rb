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

ActiveRecord::Schema.define(:version => 20140225063151) do

  create_table "accounting_offices", :force => true do |t|
    t.string   "name"
    t.integer  "regional_directorate_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "banks", :force => true do |t|
    t.string   "total_voltage"
    t.text     "visual_inspection"
    t.integer  "battery_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "inserted_by"
  end

  create_table "batteries", :force => true do |t|
    t.integer  "system_type_id"
    t.integer  "bank_no"
    t.integer  "capacity"
    t.date     "installation_date"
    t.date     "fist_installation_date"
    t.string   "installation_team"
    t.text     "remarks"
    t.integer  "station_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "battery_model_id"
  end

  create_table "battery_daily_tests", :force => true do |t|
    t.integer  "battery_id"
    t.float    "total_voltage"
    t.text     "visual_inspection"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "bank_id"
    t.string   "inserted_by"
  end

  create_table "battery_models", :force => true do |t|
    t.string   "name"
    t.float    "batt_rack_length"
    t.float    "batt_rack_width"
    t.float    "batt_rack_height"
    t.float    "batt_rack_weight"
    t.float    "cell_length"
    t.float    "cell_width"
    t.float    "cell_height"
    t.string   "manufacturer_name"
    t.float    "capacity"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.float    "cell_weight"
  end

  create_table "battery_weekly_tests", :force => true do |t|
    t.float    "cell_voltage"
    t.integer  "battery_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "bank_id"
    t.string   "inserted_by"
    t.integer  "cell_id"
    t.string   "visual_inspection"
  end

  create_table "cells", :force => true do |t|
    t.float    "cell_voltage"
    t.string   "visual_inspection"
    t.integer  "bank_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "equipment", :force => true do |t|
    t.string   "supp_company_name"
    t.string   "supp_company_address"
    t.string   "supp_company_phone"
    t.string   "supp_company_fax"
    t.text     "supp_remarks"
    t.string   "curr_local_agent_name"
    t.string   "local_agent_contact_person"
    t.integer  "local_agent_mobile"
    t.string   "local_agent_office_phone"
    t.string   "local_agent_office_fax"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "equipmentable_id"
    t.string   "equipmentable_type"
  end

  create_table "generators", :force => true do |t|
    t.string   "company_name"
    t.string   "model_no"
    t.string   "gen_type"
    t.string   "sound_level"
    t.string   "engine_manufacturer"
    t.string   "engine_model_no"
    t.string   "cooling_type"
    t.string   "alternator_manufacturer"
    t.string   "alternator_model_no"
    t.string   "engine_oil_type"
    t.string   "oil_sumo_capacity"
    t.string   "fuel_filter"
    t.string   "sec_fuel_filter"
    t.string   "air_filter"
    t.string   "water_filter"
    t.integer  "genset_length"
    t.integer  "genset_height"
    t.integer  "genset_weight"
    t.string   "starter_battery_capacity"
    t.integer  "control_panel_length"
    t.integer  "control_panel_width"
    t.integer  "control_panel_height"
    t.string   "engine_serial_no"
    t.string   "alternator_serial_no"
    t.string   "eqp_code"
    t.integer  "system_type_id"
    t.integer  "station_id"
    t.string   "installation_team"
    t.date     "first_installation_date"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.text     "remarks"
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
    t.float    "cab_length"
    t.float    "cab_width"
    t.float    "cab_height"
    t.float    "cab_weight"
    t.float    "module_length"
    t.float    "module_width"
    t.float    "module_height"
    t.float    "module_weight"
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
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "role"
    t.string   "full_name"
    t.integer  "emp_id"
    t.string   "designation"
    t.string   "working_office"
    t.string   "cell_no",                :limit => 17
    t.string   "name_emp_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
