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

ActiveRecord::Schema.define(version: 20140225151038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: true do |t|
    t.integer  "champion_id"
    t.string   "invite_key"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges_questions", id: false, force: true do |t|
    t.integer "challenge_id", null: false
    t.integer "question_id",  null: false
  end

  add_index "challenges_questions", ["challenge_id", "question_id"], name: "index_challenges_questions_on_challenge_id_and_question_id", using: :btree
  add_index "challenges_questions", ["question_id", "challenge_id"], name: "index_challenges_questions_on_question_id_and_challenge_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "query"
    t.integer  "good_answer_index"
    t.text     "desc"
    t.string   "url"
    t.integer  "points",            default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "answers",           default: [], array: true
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
