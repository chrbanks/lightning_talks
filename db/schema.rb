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

ActiveRecord::Schema.define(version: 20161124041937) do

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
    t.index ["commentable_type"], name: "index_comments_on_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "talk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["talk_id"], name: "index_favorites_on_talk_id"
    t.index ["user_id", "talk_id"], name: "index_favorites_on_user_id_and_talk_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "date",       null: false
    t.string   "title",      null: false
    t.integer  "user_id"
    t.string   "location",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "talks", force: :cascade do |t|
    t.integer  "meeting_id"
    t.string   "title",                       null: false
    t.integer  "user_id"
    t.text     "description",                 null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "category"
    t.integer  "comments_count"
    t.integer  "favorites_count", default: 0
    t.index ["meeting_id"], name: "index_talks_on_meeting_id"
    t.index ["user_id"], name: "index_talks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "favorites_count", default: 0
    t.integer  "talks_count",     default: 0
    t.index ["username"], name: "index_users_on_username"
  end

end
