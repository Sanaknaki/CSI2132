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

ActiveRecord::Schema.define(version: 20170402042342) do

  create_table "comments", force: :cascade do |t|
    t.text     "ctext"
    t.boolean  "is_company"
    t.boolean  "is_job"
    t.boolean  "is_resume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "job_id"
    t.integer  "resume_id"
    t.integer  "company_id"
    t.index ["company_id"], name: "index_comments_on_company_id"
    t.index ["job_id"], name: "index_comments_on_job_id"
    t.index ["resume_id"], name: "index_comments_on_resume_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "sector"
    t.string   "rating"
    t.string   "website"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "colour"
    t.integer  "commment_id"
    t.index ["commment_id"], name: "index_companies_on_commment_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_code"
    t.string   "course_name"
    t.text     "course_description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string   "prof"
    t.string   "letter"
    t.decimal  "numerical_grade"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "interviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
  end

  create_table "jobs", force: :cascade do |t|
    t.text     "job_description"
    t.integer  "level_direct_to"
    t.integer  "ranking"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "company_id"
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "moderators", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_moderators_on_user_id"
  end

  create_table "program_enrolleds", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "level"
    t.boolean  "coop_required"
    t.boolean  "coop_offered"
    t.integer  "credits_required"
  end

  create_table "programs", force: :cascade do |t|
    t.string   "program_name"
    t.integer  "required_number_of_credits"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "resume_comments", force: :cascade do |t|
    t.text     "ctext"
    t.integer  "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_resume_comments_on_resume_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "student_num"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string   "resume_path"
    t.integer  "version"
    t.integer  "student_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "comment_id"
    t.index ["comment_id"], name: "index_resumes_on_comment_id"
    t.index ["student_id"], name: "index_resumes_on_student_id"
  end


  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
