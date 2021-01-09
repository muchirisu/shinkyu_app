# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_08_151753) do

  create_table "follow_relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "following_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id", "following_id"], name: "index_follow_relationships_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_follow_relationships_on_follower_id"
    t.index ["following_id"], name: "index_follow_relationships_on_following_id"
  end

  create_table "newcomments", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "post_id"
    t.text "content"
  end

  create_table "newlikes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "post_id"
  end

  create_table "newposts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "newuser_id"
    t.integer "user_type"
    t.text "content"
  end

  create_table "newusers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "name"
    t.string "email"
    t.date "birthday"
    t.string "image"
    t.string "image_identification"
    t.string "prefecture"
    t.string "address"
    t.string "access"
    t.string "post_id"
    t.string "content"
    t.string "salon_homepage"
    t.integer "user_type"
    t.string "password_digest"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "following_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["following_id"], name: "index_relationships_on_following_id"
  end

  add_foreign_key "follow_relationships", "followers"
  add_foreign_key "follow_relationships", "followings"
  add_foreign_key "relationships", "newuers", column: "follower_id"
  add_foreign_key "relationships", "newuers", column: "following_id"
end
