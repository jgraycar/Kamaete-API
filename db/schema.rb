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

ActiveRecord::Schema.define(version: 20160927013158) do

  create_table "instruments", force: :cascade do |t|
    t.integer  "shape"
    t.string   "label"
    t.string   "color"
    t.decimal  "x",               precision: 8, scale: 3
    t.decimal  "y",               precision: 8, scale: 3
    t.decimal  "angle",           precision: 5, scale: 2
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "stage_layout_id"
    t.integer  "member_id"
    t.integer  "user_id"
    t.boolean  "template",                                default: false
    t.string   "kind"
    t.integer  "width"
    t.integer  "height"
    t.index ["member_id"], name: "index_instruments_on_member_id"
    t.index ["stage_layout_id"], name: "index_instruments_on_stage_layout_id"
    t.index ["user_id"], name: "index_instruments_on_user_id"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "members_performances", id: false, force: :cascade do |t|
    t.integer "performance_id"
    t.integer "member_id"
    t.index ["member_id"], name: "index_members_performances_on_member_id"
    t.index ["performance_id"], name: "index_members_performances_on_performance_id"
  end

  create_table "performances", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_performances_on_user_id"
  end

  create_table "stage_layouts", force: :cascade do |t|
    t.string   "name"
    t.integer  "performance_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.index ["performance_id"], name: "index_stage_layouts_on_performance_id"
    t.index ["user_id"], name: "index_stage_layouts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
