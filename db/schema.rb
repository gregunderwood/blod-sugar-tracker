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

ActiveRecord::Schema.define(version: 20170304202334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blood_sugar_levels", force: :cascade do |t|
    t.datetime "checked_at"
    t.decimal  "blood_sugar"
    t.string   "reference_method"
    t.boolean  "fasting"
    t.boolean  "before_meal"
    t.boolean  "after_meal"
    t.boolean  "logbook"
    t.boolean  "deleted"
    t.boolean  "control"
    t.boolean  "manual"
    t.decimal  "a1c_percentage"
    t.decimal  "a1c_measurement"
    t.integer  "insulin"
    t.string   "insulin_type"
    t.integer  "carb_grams"
    t.integer  "carb_points"
    t.string   "carb_choices"
    t.string   "comment"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
