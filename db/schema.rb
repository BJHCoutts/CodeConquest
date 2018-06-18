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

ActiveRecord::Schema.define(version: 2018_06_17_233219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drill_groups", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_drill_groups_on_user_id"
  end

  create_table "drills", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.json "questions", array: true
    t.string "answers", array: true
    t.integer "taken"
    t.bigint "drill_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "difficulty"
    t.index ["drill_group_id"], name: "index_drills_on_drill_group_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_models_on_email", unique: true
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.string "body"
    t.string "answer"
    t.string "options", array: true
    t.integer "point"
    t.bigint "drill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_id"], name: "index_questions_on_drill_id"
  end

  create_table "takes", force: :cascade do |t|
    t.bigint "drill_group_id"
    t.bigint "user_id"
    t.integer "taken_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_group_id"], name: "index_takes_on_drill_group_id"
    t.index ["user_id"], name: "index_takes_on_user_id"
  end

  create_table "transcripts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "drill_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "correct_questions", array: true
    t.integer "wrong_questions", array: true
    t.index ["drill_id"], name: "index_transcripts_on_drill_id"
    t.index ["user_id"], name: "index_transcripts_on_user_id"
  end

  create_table "user_mailers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.boolean "approved_student"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.boolean "approved", default: false, null: false
    t.index ["approved"], name: "index_users_on_approved"
  end

  add_foreign_key "drill_groups", "users"
  add_foreign_key "drills", "drill_groups"
  add_foreign_key "questions", "drills"
  add_foreign_key "takes", "drill_groups"
  add_foreign_key "takes", "users"
  add_foreign_key "transcripts", "drills"
  add_foreign_key "transcripts", "users"
end
