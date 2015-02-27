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

ActiveRecord::Schema.define(version: 20150227150740) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.string   "area_name"
    t.integer  "area_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "candidates", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "collaborator_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "organisation_id"
    t.string   "organisation_name"
  end

  add_index "candidates", ["email"], name: "index_candidates_on_email", unique: true
  add_index "candidates", ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true

  create_table "collaborations", force: true do |t|
    t.integer  "candidate_id"
    t.integer  "collaborator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

end
