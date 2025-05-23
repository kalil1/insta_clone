# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_05_22_162139) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "post_id"
    t.bigint "profile_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "caption"
    t.bigint "profile_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "post_img"
    t.index ["profile_id"], name: "index_posts_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.text "bio"
    t.string "phone"
    t.string "profile_pic"
    t.bigint "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "unions", force: :cascade do |t|
    t.integer "user1"
    t.integer "user2"
    t.integer "postid"
    t.string "union_type", default: "like"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["postid", "union_type"], name: "index_unions_on_postid_and_union_type"
    t.index ["postid", "user1", "union_type"], name: "index_unions_on_postid_and_user1_and_union_type"
    t.index ["user1", "union_type"], name: "index_unions_on_user1_and_union_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "profiles"
  add_foreign_key "posts", "profiles"
  add_foreign_key "profiles", "users"
end
