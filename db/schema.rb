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

ActiveRecord::Schema.define(:version => 20120228192747) do

  create_table "cruises", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "last_price"
    t.integer  "first_price"
  end

  add_index "cruises", ["name"], :name => "index_cruises_on_name"

  create_table "prices", :force => true do |t|
    t.integer  "cruise_id"
    t.string   "cabin_type"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prices", ["created_at"], :name => "index_prices_on_created_at"
  add_index "prices", ["cruise_id"], :name => "index_prices_on_cruise_id"
  add_index "prices", ["price"], :name => "index_prices_on_price"

end
