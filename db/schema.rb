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

ActiveRecord::Schema.define(version: 20160315190924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
  end

  create_table "extended_profile_attributes", force: :cascade do |t|
    t.string   "email_link"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "instagram_url"
    t.string   "website_url"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "favourited_id"
    t.string   "favourited_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "favourites", ["favourited_type", "favourited_id"], name: "index_favourites_on_favourited_type_and_favourited_id", using: :btree
  add_index "favourites", ["user_id"], name: "index_favourites_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "bedrooms"
    t.boolean  "roomates"
    t.date     "rent_date"
    t.integer  "price"
    t.boolean  "basement"
    t.boolean  "sublet"
    t.boolean  "utilities_included"
    t.string   "space_type"
    t.integer  "current_roommates"
    t.boolean  "wheelchair_accessible"
    t.boolean  "visually_accessible"
    t.boolean  "hearing_accessible"
    t.boolean  "assistance_animal"
    t.boolean  "fridge"
    t.boolean  "stove"
    t.boolean  "dishwasher"
    t.boolean  "microwave"
    t.boolean  "bathtub"
    t.boolean  "fireplace"
    t.boolean  "ac"
    t.boolean  "electric_heat"
    t.boolean  "forced_air_heat"
    t.boolean  "boiler_system"
    t.boolean  "cats"
    t.boolean  "dogs"
    t.boolean  "small_pets"
    t.boolean  "ensuite_laundry"
    t.boolean  "shared_laundry"
    t.boolean  "coinop_laundry"
    t.boolean  "balcony"
    t.boolean  "deck"
    t.boolean  "yard_shared"
    t.boolean  "yard_private"
    t.boolean  "pool"
    t.boolean  "exercise_room"
    t.boolean  "party_room"
    t.boolean  "furnished"
    t.boolean  "parking"
    t.boolean  "on_street_parking"
    t.boolean  "smoking"
    t.boolean  "nonsmoking"
    t.boolean  "flagged"
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.text     "about_me"
    t.string   "email",                           default: "---\n:null: true\n", null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.string   "token"
    t.string   "invite_code"
    t.string   "role",                            default: "default"
    t.string   "site_use"
    t.boolean  "flagged"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree

  add_foreign_key "favourites", "users"
  add_foreign_key "listings", "users"
end
