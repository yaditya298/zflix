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

ActiveRecord::Schema.define(version: 20160523100901) do

  create_table "chats", force: :cascade do |t|
    t.string   "subject"
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "chats", ["recipient_id"], name: "index_chats_on_recipient_id"
  add_index "chats", ["user_id"], name: "index_chats_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.boolean  "seen",         default: false
    t.text     "content"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.boolean  "seen"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "activity_type"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "relations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "subject"
  end

  add_index "relations", ["friend_id", "user_id"], name: "index_relations_on_friend_id_and_user_id", unique: true
  add_index "relations", ["friend_id"], name: "index_relations_on_friend_id"
  add_index "relations", ["user_id"], name: "index_relations_on_user_id"

  create_table "statuses", force: :cascade do |t|
    t.text     "status"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "statachment_file_name"
    t.string   "statachment_content_type"
    t.integer  "statachment_file_size"
    t.datetime "statachment_updated_at"
    t.string   "subject"
  end

  add_index "statuses", ["user_id"], name: "index_statuses_on_user_id"

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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "dob"
    t.text     "about_me"
    t.string   "gender"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
