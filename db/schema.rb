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

ActiveRecord::Schema.define(version: 2022_03_03_195645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id", null: false
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "technique"
    t.integer "sets"
    t.integer "repetitions"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_exercises_on_user_id"
  end

  create_table "history_logs", force: :cascade do |t|
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shared_exercise_id", null: false
    t.index ["shared_exercise_id"], name: "index_history_logs_on_shared_exercise_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "shared_exercise_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shared_exercise_id"], name: "index_messages_on_shared_exercise_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "shared_exercises", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "sets"
    t.integer "repetitions"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "exercise_id", null: false
    t.text "technique"
    t.index ["exercise_id"], name: "index_shared_exercises_on_exercise_id"
    t.index ["user_id"], name: "index_shared_exercises_on_user_id"
  end

  create_table "shared_training_plans", force: :cascade do |t|
    t.bigint "training_id", null: false
    t.bigint "shared_exercise_id", null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_shared_training_plans_on_booking_id"
    t.index ["shared_exercise_id"], name: "index_shared_training_plans_on_shared_exercise_id"
    t.index ["training_id"], name: "index_shared_training_plans_on_training_id"
  end

  create_table "training_plans", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "training_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_training_plans_on_exercise_id"
    t.index ["training_id"], name: "index_training_plans_on_training_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "description"
    t.string "title"
    t.string "activity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trainings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.float "weight"
    t.string "gender"
    t.boolean "trainer", default: false
    t.text "about"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "users", column: "client_id"
  add_foreign_key "exercises", "users"
  add_foreign_key "history_logs", "shared_exercises"
  add_foreign_key "messages", "shared_exercises"
  add_foreign_key "messages", "users"
  add_foreign_key "shared_exercises", "exercises"
  add_foreign_key "shared_exercises", "users"
  add_foreign_key "shared_training_plans", "bookings"
  add_foreign_key "shared_training_plans", "shared_exercises"
  add_foreign_key "shared_training_plans", "trainings"
  add_foreign_key "training_plans", "exercises"
  add_foreign_key "training_plans", "trainings"
  add_foreign_key "trainings", "users"
end
