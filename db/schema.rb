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

ActiveRecord::Schema.define(version: 2019_06_29_232207) do

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.date "dob"
    t.string "education_level"
    t.string "education_specialization"
    t.string "employer"
    t.string "place_of_birth"
    t.string "current_resident_country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "org_type"
    t.string "readable_ids"
    t.string "writable_ids"
    t.boolean "is_producer"
    t.boolean "is_validator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
