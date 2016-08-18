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

ActiveRecord::Schema.define(version: 20160817161317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "implementer_requests", force: true do |t|
    t.string   "classroom",  default: ""
    t.datetime "start_date"
    t.integer  "duration",   default: 0
    t.integer  "School_id"
    t.integer  "User_id"
    t.integer  "Program_id"
    t.string   "status",     default: "pending"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "implementer_requests", ["Program_id"], name: "index_implementer_requests_on_Program_id", using: :btree
  add_index "implementer_requests", ["School_id"], name: "index_implementer_requests_on_School_id", using: :btree
  add_index "implementer_requests", ["User_id"], name: "index_implementer_requests_on_User_id", using: :btree

  create_table "lessons", force: true do |t|
    t.string   "name",                   default: ""
    t.datetime "date"
    t.integer  "implementer_request_id"
    t.string   "status",                 default: "pending"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "lessons", ["implementer_request_id"], name: "index_lessons_on_implementer_request_id", using: :btree

  create_table "programs", force: true do |t|
    t.string   "name"
    t.integer  "duration"
    t.string   "participants"
    t.string   "overview"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "district"
    t.integer  "prep_classes"
    t.integer  "sec_classes"
    t.integer  "uni_classes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: true do |t|
    t.string   "name",                   default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "telephone",              default: "",    null: false
    t.string   "work_type",              default: ""
    t.string   "area_residence",         default: ""
    t.string   "service_area",           default: ""
    t.string   "coordination_skills",    default: ""
    t.string   "implementation_skills",  default: ""
    t.float    "appraisal_grade",        default: 0.0
    t.string   "employee_type",          default: ""
    t.boolean  "admin",                  default: false, null: false
    t.integer  "Company_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "users", ["Company_id"], name: "index_users_on_Company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
