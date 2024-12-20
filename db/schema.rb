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

ActiveRecord::Schema[7.1].define(version: 2024_12_20_163416) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_classrooms_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.string "question_type"
    t.text "choices"
    t.text "answer"
    t.text "rubric"
    t.bigint "worksheet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["worksheet_id"], name: "index_questions_on_worksheet_id"
  end

  create_table "student_enrollment_codes", force: :cascade do |t|
    t.bigint "classroom_id", null: false
    t.string "code"
    t.string "email"
    t.boolean "used"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_student_enrollment_codes_on_classroom_id"
    t.index ["code"], name: "index_student_enrollment_codes_on_code", unique: true
    t.index ["user_id"], name: "index_student_enrollment_codes_on_user_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "worksheet_id", null: false
    t.json "answers"
    t.json "grades"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_submissions_on_student_id"
    t.index ["worksheet_id"], name: "index_submissions_on_worksheet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "worksheets", force: :cascade do |t|
    t.string "title"
    t.bigint "classroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_worksheets_on_classroom_id"
  end

  add_foreign_key "classrooms", "courses"
  add_foreign_key "courses", "users", column: "teacher_id"
  add_foreign_key "questions", "worksheets"
  add_foreign_key "student_enrollment_codes", "classrooms"
  add_foreign_key "student_enrollment_codes", "users"
  add_foreign_key "submissions", "users", column: "student_id"
  add_foreign_key "submissions", "worksheets"
  add_foreign_key "worksheets", "classrooms"
end
