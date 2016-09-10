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

ActiveRecord::Schema.define(version: 20160812041108) do

  create_table "artists", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "eb_uid"
    t.string   "website"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "print_classes", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "print_markings", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "print_price_points", force: true do |t|
    t.integer  "print_id"
    t.decimal  "six_month_average_price"
    t.decimal  "average_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "print_sizes", force: true do |t|
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "print_statuses", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "print_techniques", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prints", force: true do |t|
    t.string   "title"
    t.integer  "run_size"
    t.date     "release_date"
    t.decimal  "original_price"
    t.integer  "eb_uid"
    t.integer  "artist_id"
    t.integer  "print_size_id"
    t.integer  "print_class_id"
    t.integer  "print_status_id"
    t.integer  "print_technique_id"
    t.integer  "print_marking_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", force: true do |t|
    t.integer  "print_id"
    t.decimal  "price"
    t.decimal  "shipping_cost"
    t.date     "transaction_date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "purchase_id"
    t.integer  "print_id"
    t.decimal  "price"
    t.decimal  "shipping_cost"
    t.date     "transaction_date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_types", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.integer  "transaction_type_id"
    t.integer  "print_id"
    t.decimal  "price"
    t.decimal  "shipping_cost"
    t.date     "transaction_date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "versions", force: true do |t|
    t.string   "item_type",                     null: false
    t.integer  "item_id",                       null: false
    t.string   "event",                         null: false
    t.string   "whodunnit"
    t.text     "object",     limit: 1073741823
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
