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

ActiveRecord::Schema.define(version: 2018_10_10_181426) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "houses", force: :cascade do |t|
    t.string "location"
    t.integer "sqft"
    t.string "yearbuilt"
    t.string "style"
    t.string "price"
    t.integer "floors"
    t.boolean "basement"
    t.string "currentowner"
    t.integer "real_estate_company_id"
    t.integer "realtor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_estate_company_id"], name: "index_houses_on_real_estate_company_id"
    t.index ["realtor_id"], name: "index_houses_on_realtor_id"
  end

  create_table "hunters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "phone"
    t.string "prefcon"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_hunters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_hunters_on_reset_password_token", unique: true
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "subject"
    t.text "content"
    t.integer "hunter_id"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_inquiries_on_house_id"
    t.index ["hunter_id"], name: "index_inquiries_on_hunter_id"
  end

  create_table "real_estate_companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.integer "size"
    t.string "founded"
    t.string "revenue"
    t.text "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "realtors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.integer "real_estate_company_id"
    t.index ["email"], name: "index_realtors_on_email", unique: true
    t.index ["real_estate_company_id"], name: "index_realtors_on_real_estate_company_id"
    t.index ["reset_password_token"], name: "index_realtors_on_reset_password_token", unique: true
  end

end
