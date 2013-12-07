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

ActiveRecord::Schema.define(version: 20131207015222) do

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", force: true do |t|
    t.string   "coupon_code"
    t.integer  "times_used",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "coupon_type"
    t.string   "usage"
    t.integer  "discount_value"
    t.integer  "product_id"
  end

  add_index "coupons", ["product_id"], name: "index_coupons_on_product_id"

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",                           default: 1
    t.decimal  "price",      precision: 8, scale: 2
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id"

  create_table "orders", force: true do |t|
    t.string   "first_name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "ship_date"
    t.string   "last_name"
    t.string   "city"
    t.string   "zipcode"
    t.string   "state"
    t.integer  "user_id"
    t.decimal  "total_price"
    t.string   "stripe_customer_token"
    t.decimal  "discount",              precision: 8, scale: 2
    t.integer  "coupon_id"
    t.boolean  "shipped",                                       default: false
    t.string   "phone_nr"
  end

  add_index "orders", ["coupon_id"], name: "index_orders_on_coupon_id"

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_downloadable",        default: false
    t.string   "downloadable_file_size"
    t.boolean  "visible",                default: true
  end

  create_table "products_videos", id: false, force: true do |t|
    t.integer "product_id"
    t.integer "video_id"
  end

  create_table "slides", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "videos", force: true do |t|
    t.string   "name"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

end
