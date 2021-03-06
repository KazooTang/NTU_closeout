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

ActiveRecord::Schema.define(version: 20150624191142) do

  create_table "attachments", force: :cascade do |t|
    t.string   "full_picture"
    t.string   "attachment_id"
    t.string   "link"
    t.integer  "product_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "message"
  end

  add_index "attachments", ["product_id"], name: "index_attachments_on_product_id"

  create_table "follows", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "follows", ["product_id"], name: "index_follows_on_product_id"
  add_index "follows", ["user_id"], name: "index_follows_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "product_id",   null: false
    t.string   "seller_id"
    t.string   "seller_name"
    t.text     "message"
    t.string   "full_picture"
    t.string   "link"
    t.datetime "created_time"
    t.datetime "updated_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "price"
    t.string   "product_name"
    t.string   "place"
    t.string   "picture"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
