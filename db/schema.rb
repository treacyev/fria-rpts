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

ActiveRecord::Schema.define(version: 20170525161209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.boolean  "isDraft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deans", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "title"
    t.string   "principal_researcher"
    t.text     "coresearchers"
    t.float    "rdCost"
    t.string   "sourceExternal"
    t.string   "amountExternal"
    t.text     "facMat"
    t.text     "objectives"
    t.text     "expectedOutputs"
    t.text     "description"
    t.string   "weeklyHours"
    t.boolean  "endorsement"
    t.boolean  "submitAgency"
    t.text     "listAgency"
    t.string   "attachment"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.integer  "status"
    t.boolean  "is_draft"
    t.string   "recommendation"
    t.integer  "head_vote"
    t.index ["user_id"], name: "index_proposals_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "attachment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "vote"
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.text     "comment"
    t.index ["proposal_id"], name: "index_reviews_on_proposal_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "submission_periods", force: :cascade do |t|
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "department"
    t.string   "rank"
    t.string   "contact_number"
    t.string   "type"
    t.boolean  "submitted"
    t.boolean  "activated?"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "proposals", "users"
  add_foreign_key "reviews", "proposals"
  add_foreign_key "reviews", "users"
end
