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

ActiveRecord::Schema.define(version: 2020_11_17_113122) do

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

  create_table "student_events", force: :cascade do |t|
    t.bigint "student_member_id", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.index ["created_at"], name: "index_student_events_on_created_at"
    t.index ["student_member_id", "created_at"], name: "index_student_events_on_student_member_id_and_created_at"
  end

  create_table "student_members", force: :cascade do |t|
    t.string "student_number", null: false
    t.string "email"
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.integer "birth_day"
    t.string "telephone_number"
    t.string "emergency_contact", null: false
    t.string "hashed_password"
    t.integer "grade"
    t.integer "a_class"
    t.string "homeroom_teacher"
    t.date "start_date", null: false
    t.date "graduation_date"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teacher_members", force: :cascade do |t|
    t.string "email", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "hashed_password"
    t.string "subject"
    t.integer "homeroom"
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "lower((email)::text)", name: "index_teacher_members_on_LOWER_email", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_teacher_members_on_family_name_kana_and_given_name_kana"
  end

  add_foreign_key "addresses", "teacher_members"
  add_foreign_key "student_events", "student_members"
end
