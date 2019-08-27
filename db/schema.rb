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

ActiveRecord::Schema.define(version: 2019_08_27_124432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "requests", force: :cascade do |t|
    t.string "type"
    t.text "content"
    t.bigint "client_id"
    t.bigint "advisor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_requests_on_advisor_id"
    t.index ["client_id"], name: "index_requests_on_client_id"
  end

  create_table "responses", force: :cascade do |t|
    t.text "content"
    t.bigint "request_id"
    t.bigint "advisor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_responses_on_advisor_id"
    t.index ["request_id"], name: "index_responses_on_request_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "client_id"
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_reviews_on_client_id"
    t.index ["request_id"], name: "index_reviews_on_request_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.integer "response_time"
    t.string "role"
    t.integer "monthly_income"
    t.text "bio"
    t.boolean "budgeting"
    t.boolean "saving"
    t.boolean "bill_paying"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "requests", "users", column: "advisor_id"
  add_foreign_key "requests", "users", column: "client_id"
  add_foreign_key "responses", "users", column: "advisor_id"
  add_foreign_key "reviews", "users", column: "client_id"
end
