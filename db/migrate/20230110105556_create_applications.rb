class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_enum :application_status, ['-1', '0', '1']
    create_table :applications, primary_key: [:job_id, :user_id], charset: "unicode", force: :cascade do |t|
      t.integer "job_id", null: false
      # t.integer "applicant_id", null: false
      #      t.datetime "applied_at", default: -> { DateTime.now }
      #      t.column(:applied_at, :datetime)
      t.integer "user_id", null: false
      t.datetime "updated_at", default: DateTime.now, null: false
      t.datetime "applied_at", default: DateTime.now, null: false
      t.enum "status", enum_type: "application_status", default: '0', null: false
      t.string "application_text", limit: 1000
      t.string "application_documents", limit: 100
      t.string "response", limit: 500

      t.index ["user_id"], name: "application_user_id_index"
      t.index ["job_id"], name: "application_job_id_index"
      t.index ["job_id", "user_id"], name: "application_job_id_user_id_index", unique: true
    end
  end
end
