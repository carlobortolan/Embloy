class CreateJobNotifications < ActiveRecord::Migration[7.0]
  def change
    create_enum :notify_type, ['0', '1']

    create_table :job_notifications, primary_key: [:employer_id, :job_id], charset: "unicode", force: :cascade do |t|
      t.integer :employer_id, null: false
      t.integer :job_id, null: false
      t.enum :notify, enum_type: "notify_type", default: '0', null: false
      t.index [:job_id], name: "notification_job_id_index"
      t.timestamps
    end
  end
end
