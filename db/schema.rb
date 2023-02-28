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

ActiveRecord::Schema[7.0].define(version: 2023_02_28_021741) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "application_status", ["-1", "0", "1"]
  create_enum "job_status", ["public", "private", "archieved"]
  create_enum "notify_type", ["0", "1"]
  create_enum "rating_type", ["1", "2", "3", "4", "5"]
  create_enum "user_type", ["company", "private"]

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "applications", primary_key: ["job_id", "user_id"], force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "user_id", null: false
    t.datetime "updated_at", default: "2023-02-27 23:06:10", null: false
    t.datetime "applied_at", default: "2023-02-27 23:06:10", null: false
    t.enum "status", default: "0", null: false, enum_type: "application_status"
    t.string "application_text", limit: 1000
    t.string "application_documents", limit: 100
    t.string "response", limit: 500
    t.index ["job_id", "user_id"], name: "application_job_id_user_id_index", unique: true
    t.index ["job_id"], name: "application_job_id_index"
    t.index ["user_id"], name: "application_user_id_index"
  end

  create_table "auth_blacklists", force: :cascade do |t|
    t.string "token", limit: 500, null: false
    t.integer "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "token_UNIQUE", unique: true
  end

  create_table "company_users", id: :serial, force: :cascade do |t|
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currents", force: :cascade do |t|
    t.datetime "created_at", default: "2023-02-27 23:06:11", null: false
    t.datetime "updated_at", default: "2023-02-27 23:06:11", null: false
  end

  create_table "job_notifications", primary_key: ["employer_id", "job_id"], force: :cascade do |t|
    t.integer "employer_id", null: false
    t.integer "job_id", null: false
    t.enum "notify", default: "0", null: false, enum_type: "notify_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "notification_job_id_index"
  end

  create_table "jobs", primary_key: "job_id", id: :serial, force: :cascade do |t|
    t.string "job_type"
    t.integer "job_status", limit: 2, default: 0
    t.enum "status", default: "public", null: false, enum_type: "job_status"
    t.integer "user_id", default: 0
    t.integer "duration", default: 0
    t.string "code_lang", limit: 2
    t.string "title", limit: 100
    t.string "position", limit: 100
    t.text "description"
    t.string "key_skills", limit: 100
    t.integer "salary"
    t.string "currency"
    t.string "image_url", limit: 500
    t.datetime "start_slot", precision: nil
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.string "country_code", limit: 45
    t.string "postal_code", limit: 45
    t.string "city", limit: 45
    t.string "address", limit: 45
    t.integer "view_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "application_count"
    t.index ["country_code"], name: " job_country_code_index "
    t.index ["job_id"], name: "job_job_id_index"
    t.index ["postal_code"], name: " job_postal_code_index "
    t.index ["user_id"], name: "job_user_id_index "
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "private_users", id: :serial, force: :cascade do |t|
    t.string "private_attr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", primary_key: "user_id", id: :serial, force: :cascade do |t|
    t.enum "rating", default: "1", null: false, enum_type: "rating_type"
    t.text "message"
    t.integer "created_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "reviews_created_by_index"
  end

  create_table "user_blacklists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "user_id_UNIQUE", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.integer "activity_status", limit: 2, default: 0, null: false
    t.string "image_url", limit: 500
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.float "longitude"
    t.float "latitude"
    t.string "country_code", limit: 45
    t.string "postal_code", limit: 45
    t.string "city", limit: 45
    t.string "address", limit: 45
    t.datetime "date_of_birth"
    t.enum "user_type", default: "private", null: false, enum_type: "user_type"
    t.integer "view_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "application_count"
    t.integer "job_count"
    t.index ["email"], name: "user_email_index", unique: true
    t.index ["first_name", "last_name"], name: "user_name_index"
    t.index ["user_type"], name: "user_user_type_index"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applications", "jobs", primary_key: "job_id", on_delete: :cascade
  add_foreign_key "applications", "users", on_delete: :cascade
  add_foreign_key "company_users", "users", column: "id", on_delete: :cascade
  add_foreign_key "job_notifications", "jobs", primary_key: "job_id", on_delete: :cascade
  add_foreign_key "job_notifications", "users", column: "employer_id", on_delete: :cascade
  add_foreign_key "jobs", "users", on_delete: :cascade
  add_foreign_key "private_users", "users", column: "id", on_delete: :cascade
  add_foreign_key "reviews", "users", column: "created_by"
end
