# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_28_164856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pill_list_joins", force: :cascade do |t|
    t.integer "pill_list_id"
    t.integer "pill_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pill_lists", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pills", force: :cascade do |t|
    t.string "name"
    t.string "purpose"
    t.string "description"
    t.string "dose"
    t.string "pregnancy"
    t.string "warnings"
    t.string "stop_use"
    t.string "brand"
    t.string "route"
    t.string "package_label"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
