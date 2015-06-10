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

ActiveRecord::Schema.define(version: 20150608012221) do

  create_table "alarms", force: :cascade do |t|
    t.time     "time"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.string   "message"
    t.boolean  "turn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "alarms", ["user_id"], name: "index_alarms_on_user_id"

  create_table "band_informations", force: :cascade do |t|
    t.integer  "steps"
    t.decimal  "lat"
    t.decimal  "long"
    t.integer  "user_id"
    t.integer  "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "calories"
  end

  add_index "band_informations", ["band_id"], name: "index_band_informations_on_band_id"
  add_index "band_informations", ["user_id"], name: "index_band_informations_on_user_id"

  create_table "band_typegoers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "band_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "path"
  end

  create_table "bands", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "band_typegoer_id"
    t.integer  "band_type_id"
    t.integer  "user_id"
  end

  add_index "bands", ["band_type_id"], name: "index_bands_on_band_type_id"
  add_index "bands", ["band_typegoer_id"], name: "index_bands_on_band_typegoer_id"
  add_index "bands", ["user_id"], name: "index_bands_on_user_id"

  create_table "cycling_sessions", force: :cascade do |t|
    t.integer  "distance"
    t.integer  "velocity"
    t.integer  "fitness_session_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "cycling_sessions", ["fitness_session_id"], name: "index_cycling_sessions_on_fitness_session_id"

  create_table "dream_sessions", force: :cascade do |t|
    t.datetime "time_started"
    t.datetime "time_finished"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "dream_sessions", ["user_id"], name: "index_dream_sessions_on_user_id"

  create_table "fitness_sessions", force: :cascade do |t|
    t.integer  "burned_calories"
    t.integer  "hearth_rate"
    t.time     "total_time"
    t.datetime "time_started"
    t.datetime "time_finished"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.integer  "type_session_id"
    t.integer  "type_sessiongoer_id"
  end

  add_index "fitness_sessions", ["type_session_id"], name: "index_fitness_sessions_on_type_session_id"
  add_index "fitness_sessions", ["type_sessiongoer_id"], name: "index_fitness_sessions_on_type_sessiongoer_id"
  add_index "fitness_sessions", ["user_id"], name: "index_fitness_sessions_on_user_id"

  create_table "goals", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "time_started"
    t.date     "time_finished"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "frequency"
    t.integer  "goal"
    t.integer  "type_goal_id"
    t.integer  "type_goalgoer_id"
    t.boolean  "automatic_goal"
    t.integer  "progress"
    t.boolean  "complete"
  end

  add_index "goals", ["type_goal_id"], name: "index_goals_on_type_goal_id"
  add_index "goals", ["type_goalgoer_id"], name: "index_goals_on_type_goalgoer_id"

  create_table "jogging_sessions", force: :cascade do |t|
    t.integer  "distance"
    t.integer  "steps"
    t.integer  "fitness_session_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "jogging_sessions", ["fitness_session_id"], name: "index_jogging_sessions_on_fitness_session_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "type_cycling_sessionsgoers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_goalgoers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_goals", force: :cascade do |t|
    t.string   "tip"
    t.string   "img"
    t.integer  "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "type_goals", ["goal_id"], name: "index_type_goals_on_goal_id"

  create_table "type_jogging_sessionsgoers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_sessiongoers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tipo"
  end

  create_table "type_weight_lifting_sessiongoers", force: :cascade do |t|
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "last_name"
    t.decimal  "weight"
    t.decimal  "height"
    t.string   "sex"
    t.date     "birthdate"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

  create_table "weight_lifting_sessions", force: :cascade do |t|
    t.string   "muscle"
    t.integer  "series"
    t.integer  "fitness_session_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "weight_lifting_sessions", ["fitness_session_id"], name: "index_weight_lifting_sessions_on_fitness_session_id"

end
