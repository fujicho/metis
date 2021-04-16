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

ActiveRecord::Schema.define(version: 2021_03_16_081822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "teacher_member_id", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address1", null: false
    t.string "address2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_member_id"], name: "index_addresses_on_teacher_member_id"
  end

  create_table "administrators", force: :cascade do |t|
    t.string "admin_number", null: false
    t.string "hashed_password"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "teacher_member_id"
    t.bigint "student_member_id"
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["student_member_id"], name: "index_answers_on_student_member_id"
    t.index ["teacher_member_id"], name: "index_answers_on_teacher_member_id"
  end

  create_table "board_messages", force: :cascade do |t|
    t.bigint "teacher_member_id", null: false
    t.string "tag", null: false
    t.string "subject", null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag"], name: "index_board_messages_on_tag"
    t.index ["teacher_member_id"], name: "index_board_messages_on_teacher_member_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "book_name", null: false
    t.string "book_subject", null: false
    t.string "book_year"
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_name"], name: "index_books_on_book_name"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "student_member_id", null: false
    t.bigint "book_id", null: false
    t.string "title", null: false
    t.string "body", null: false
    t.string "subject"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_questions_on_book_id"
    t.index ["student_member_id"], name: "index_questions_on_student_member_id"
  end

  create_table "student_events", force: :cascade do |t|
    t.bigint "student_member_id", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.index ["created_at"], name: "index_student_events_on_created_at"
    t.index ["student_member_id", "created_at"], name: "index_student_events_on_student_member_id_and_created_at"
  end

  create_table "student_member_addresses", force: :cascade do |t|
    t.bigint "student_member_id", null: false
    t.string "type", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address1", null: false
    t.string "address2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city"], name: "index_student_member_addresses_on_city"
    t.index ["student_member_id"], name: "index_student_member_addresses_on_student_member_id"
    t.index ["type", "city"], name: "index_student_member_addresses_on_type_and_city"
    t.index ["type", "prefecture", "city"], name: "index_student_member_addresses_on_type_and_prefecture_and_city"
    t.index ["type", "student_member_id"], name: "index_student_member_addresses_on_type_and_student_member_id", unique: true
  end

  create_table "student_members", force: :cascade do |t|
    t.string "student_number", null: false
    t.string "email", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "gender", null: false
    t.date "birth_day", null: false
    t.string "telephone_number", null: false
    t.string "emergency_contact", null: false
    t.string "hashed_password"
    t.integer "grade", null: false
    t.integer "a_class", null: false
    t.string "homeroom_teacher", null: false
    t.date "start_date", null: false
    t.date "graduation_date"
    t.string "bunri"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_mday"
    t.index ["birth_year", "birth_month", "birth_mday"], name: "index_student_on_birth_year_month_and_mday"
    t.index ["birth_year", "birth_month"], name: "index_student_members_on_birth_year_and_birth_month"
    t.index ["birth_year", "family_name_kana", "given_name_kana"], name: "index_student_on_birth_year_and_furigana"
    t.index ["family_name_kana"], name: "index_student_members_on_family_name_kana"
    t.index ["given_name_kana"], name: "index_student_members_on_given_name_kana"
    t.index ["grade", "a_class"], name: "index_student_members_on_grade_and_a_class"
    t.index ["grade", "family_name_kana"], name: "index_student_members_on_grade_and_family_name_kana"
  end

  create_table "teacher_members", force: :cascade do |t|
    t.string "email", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "hashed_password"
    t.string "subject"
    t.string "gender"
    t.string "homeroom_1"
    t.string "homeroom_2"
    t.date "birthday"
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "lower((email)::text)", name: "index_teacher_members_on_LOWER_email", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_teacher_members_on_family_name_kana_and_given_name_kana"
  end

  add_foreign_key "addresses", "teacher_members"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "student_members"
  add_foreign_key "answers", "teacher_members"
  add_foreign_key "board_messages", "teacher_members"
  add_foreign_key "questions", "books"
  add_foreign_key "questions", "student_members"
  add_foreign_key "student_events", "student_members"
  add_foreign_key "student_member_addresses", "student_members"
end
