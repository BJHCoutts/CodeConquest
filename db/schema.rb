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

ActiveRecord::Schema.define(version: 2018_06_18_020251) do

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
    t.bigint "drill_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "difficulty"
    t.index ["drill_group_id"], name: "index_drills_on_drill_group_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "body"
    t.integer "answer"
    t.string "options", default: [], array: true
    t.integer "point"
    t.bigint "drill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_id"], name: "index_questions_on_drill_id"
  end

  create_table "records", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.bigint "drill_id"
    t.bigint "transcript_id"
    t.integer "student_answer"
    t.boolean "is_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_id"], name: "index_records_on_drill_id"
    t.index ["question_id"], name: "index_records_on_question_id"
    t.index ["transcript_id"], name: "index_records_on_transcript_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "transcripts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "drill_id"
    t.integer "student_score"
    t.integer "full_mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_id"], name: "index_transcripts_on_drill_id"
    t.index ["user_id"], name: "index_transcripts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
<<<<<<< HEAD
    t.boolean "is_approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=======
    t.boolean "approved_student", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score", default: 0
>>>>>>> 2b4f8694adff95e3347e9951c89d6539a13cc450
  end

  add_foreign_key "drill_groups", "users"
  add_foreign_key "drills", "drill_groups"
  add_foreign_key "questions", "drills"
  add_foreign_key "records", "drills"
  add_foreign_key "records", "questions"
  add_foreign_key "records", "transcripts"
  add_foreign_key "records", "users"
  add_foreign_key "transcripts", "drills"
  add_foreign_key "transcripts", "users"
end
