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

ActiveRecord::Schema.define(version: 20180514125147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id"
    t.bigint "registration_user_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["registration_user_id"], name: "index_comments_on_registration_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "registration_user_id"
    t.index ["registration_user_id"], name: "index_posts_on_registration_user_id"
  end

  create_table "registration_users", force: :cascade do |t|
    t.string "phone_number"
    t.string "password"
    t.string "password_salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_hash"
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.string "signature"
    t.integer "posts_count", default: 0, null: false
    t.integer "comments_count", default: 0, null: false
  end

  create_table "sms_verifications", force: :cascade do |t|
    t.string "phone_number"
    t.string "verification_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
