# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_03_17_003434) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baths", force: :cascade do |t|
    t.time "time", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "name", null: false
    t.integer "gender", default: 0, null: false
    t.integer "age", null: false
    t.date "birthday", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "execretions", force: :cascade do |t|
    t.time "time", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "head_circumferences", force: :cascade do |t|
    t.time "time", null: false
    t.float "length", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "heights", force: :cascade do |t|
    t.float "height", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "left_breast_milks", force: :cascade do |t|
    t.time "time", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "meals", force: :cascade do |t|
    t.time "time", null: false
    t.integer "kinds", default: 0, null: false
    t.string "memo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "milks", force: :cascade do |t|
    t.integer "amount", null: false
    t.time "time", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "pees", force: :cascade do |t|
    t.time "time", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "poops", force: :cascade do |t|
    t.time "time", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "right_breast_milks", force: :cascade do |t|
    t.time "time", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.time "time", null: false
    t.integer "kinds", default: 0, null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "temperatures", force: :cascade do |t|
    t.time "time", null: false
    t.float "temperature", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weights", force: :cascade do |t|
    t.float "weight", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
  end

end
