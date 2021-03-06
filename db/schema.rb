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

ActiveRecord::Schema.define(version: 20170629211108) do

  create_table "collaboration_callbacks", force: :cascade do |t|
    t.string   "request_method"
    t.string   "host"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_id"
    t.string   "code"
    t.string   "name"
    t.integer  "instructor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["instructor_id"], name: "index_courses_on_instructor_id"
  end

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "course_id",  null: false
    t.integer "student_id", null: false
    t.index ["course_id"], name: "index_courses_students_on_course_id"
    t.index ["student_id"], name: "index_courses_students_on_student_id"
  end

  create_table "rails_lti2_provider_lti_launches", force: :cascade do |t|
    t.integer  "tool_id",    limit: 8
    t.string   "nonce"
    t.text     "message"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "rails_lti2_provider_registrations", force: :cascade do |t|
    t.string   "uuid"
    t.text     "registration_request_params"
    t.text     "tool_proxy_json"
    t.string   "workflow_state"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "tool_id",                     limit: 8
    t.text     "correlation_id"
    t.index ["correlation_id"], name: "index_rails_lti2_provider_registrations_on_correlation_id", unique: true
  end

  create_table "rails_lti2_provider_tools", force: :cascade do |t|
    t.string   "uuid"
    t.text     "shared_secret"
    t.text     "tool_settings"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "lti_version"
  end

  create_table "recordings", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "video_data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "student_id"
    t.index ["student_id"], name: "index_recordings_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_id"
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
