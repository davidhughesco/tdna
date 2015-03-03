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

ActiveRecord::Schema.define(version: 20150303141511) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.string   "area_name"
    t.integer  "area_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administrators", force: true do |t|
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
    t.string   "passcode"
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true

  create_table "areas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "candidates", force: true do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
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
    t.integer  "role_visits"
    t.integer  "tdna_visits"
    t.integer  "collaborator_role_visits"
    t.integer  "collaborator_tdna_visits"
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

  create_table "needs_analyses", force: true do |t|
    t.integer  "candidate_id"
    t.integer  "collaborator_id"
    t.integer  "activity_id"
    t.integer  "area_id"
    t.integer  "order_id"
    t.integer  "relevance"
    t.integer  "interest"
    t.integer  "skill"
    t.boolean  "current_relevance"
    t.boolean  "future_relevance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "needs_analyses", ["candidate_id"], name: "index_needs_analyses_on_candidate_id"

  create_table "role_candidates", force: true do |t|
    t.integer  "candidate_id"
    t.string   "current_role"
    t.string   "time_in_role"
    t.string   "previous_role"
    t.string   "next_role"
    t.text     "qualifications"
    t.string   "previous_role_context"
    t.string   "current_role_context"
    t.string   "next_role_context"
    t.string   "main_aspect_a"
    t.string   "main_aspect_b"
    t.string   "main_aspect_c"
    t.string   "main_aspect_d"
    t.string   "main_aspect_e"
    t.integer  "main_aspect_importance_a"
    t.integer  "main_aspect_importance_b"
    t.integer  "main_aspect_importance_c"
    t.integer  "main_aspect_importance_d"
    t.integer  "main_aspect_importance_e"
    t.integer  "main_aspect_enjoyment_a"
    t.integer  "main_aspect_enjoyment_b"
    t.integer  "main_aspect_enjoyment_c"
    t.integer  "main_aspect_enjoyment_d"
    t.integer  "main_aspect_enjoyment_e"
    t.text     "secondary_aspect"
    t.text     "unnecessary_aspect"
    t.text     "short_term_training"
    t.text     "medium_term_training"
    t.text     "long_term_training"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "role_candidates", ["candidate_id"], name: "index_role_candidates_on_candidate_id"

  create_table "role_collaborators", force: true do |t|
    t.integer  "candidate_id"
    t.integer  "collaborator_id"
    t.string   "current_role"
    t.string   "next_role"
    t.string   "current_role_context"
    t.string   "next_role_context"
    t.string   "main_aspect_1"
    t.string   "main_aspect_2"
    t.string   "main_aspect_3"
    t.string   "main_aspect_4"
    t.string   "main_aspect_5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "role_collaborators", ["candidate_id"], name: "index_role_collaborators_on_candidate_id"

end
