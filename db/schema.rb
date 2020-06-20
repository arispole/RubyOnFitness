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

ActiveRecord::Schema.define(version: 2020_06_20_101155) do

  create_table "booked_private_lessons", force: :cascade do |t|
    t.integer "private_lesson_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["private_lesson_id"], name: "index_booked_private_lessons_on_private_lesson_id"
    t.index ["user_id"], name: "index_booked_private_lessons_on_user_id"
  end

  create_table "exercise_routines", force: :cascade do |t|
    t.integer "workout_plan_id", null: false
    t.integer "exercise_id", null: false
    t.integer "serie"
    t.integer "ripetizione"
    t.integer "chilogrammi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_exercise_routines_on_exercise_id"
    t.index ["workout_plan_id"], name: "index_exercise_routines_on_workout_plan_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "nome"
    t.text "descrizione"
    t.string "gruppo_muscolare"
    t.binary "pittogramma"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "listasocis", force: :cascade do |t|
    t.string "nome"
    t.string "cognome"
    t.string "datasocio"
    t.string "datanascita"
    t.string "peso"
    t.string "altezza"
    t.string "sesso"
    t.string "email"
    t.string "indirizzo"
    t.string "password"
    t.string "username"
    t.string "tipoabbonamento"
    t.string "idtessera"
    t.text "varie"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "private_lessons", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "inizio"
    t.boolean "booked", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_private_lessons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nome"
    t.string "cognome"
    t.date "datanascita"
    t.string "sesso"
    t.integer "peso"
    t.integer "altezza"
    t.date "datasocio"
    t.string "tipoabbonamento"
    t.string "idtessera"
    t.string "indirizzo"
    t.text "varie"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin_role", default: false
    t.boolean "trainer_role", default: false
    t.boolean "user_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_plans", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nome"
    t.index ["user_id"], name: "index_workout_plans_on_user_id"
  end

  add_foreign_key "booked_private_lessons", "private_lessons"
  add_foreign_key "booked_private_lessons", "users"
  add_foreign_key "exercise_routines", "exercises"
  add_foreign_key "exercise_routines", "workout_plans"
  add_foreign_key "private_lessons", "users"
  add_foreign_key "workout_plans", "users"
end
