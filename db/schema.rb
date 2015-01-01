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

ActiveRecord::Schema.define(version: 20150101214450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "restaurant_comments", force: true do |t|
    t.string   "title",         null: false
    t.text     "body",          null: false
    t.integer  "restaurant_id", null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurant_comments", ["restaurant_id", "user_id"], name: "index_restaurant_comments_on_restaurant_id_and_user_id", unique: true, using: :btree

  create_table "restaurant_pictures", force: true do |t|
    t.integer  "restaurant_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "restaurant_ratings", force: true do |t|
    t.integer  "rating",        null: false
    t.integer  "restaurant_id", null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurant_ratings", ["restaurant_id", "user_id"], name: "index_restaurant_ratings_on_restaurant_id_and_user_id", unique: true, using: :btree

  create_table "restaurant_types", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.integer  "user_id",           null: false
    t.string   "name",              null: false
    t.string   "address",           null: false
    t.float    "lat"
    t.float    "lon"
    t.integer  "type_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumbnail_img_url"
  end

  add_index "restaurants", ["user_id", "name", "address"], name: "index_restaurants_on_user_id_and_name_and_address", unique: true, using: :btree

  create_table "user_favorite_lists", force: true do |t|
    t.integer  "user_id",       null: false
    t.integer  "restaurant_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_favorite_lists", ["user_id", "restaurant_id"], name: "index_user_favorite_lists_on_user_id_and_restaurant_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "provider",                            null: false
    t.string   "uid",                    default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pseudo"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
