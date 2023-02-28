class ForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :private_users, :users, column: :id, primary_key: :id, on_delete: :cascade
    add_foreign_key :company_users, :users, column: :id, primary_key: :id, on_delete: :cascade

    add_foreign_key :jobs, :users, column: :user_id, primary_key: :id, on_delete: :cascade

    add_foreign_key :applications, :users, column: :user_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :applications, :jobs, column: :job_id, primary_key: :job_id, on_delete: :cascade

    add_foreign_key :job_notifications, :users, column: :employer_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :job_notifications, :jobs, column: :job_id, primary_key: :job_id, on_delete: :cascade

    add_foreign_key :reviews, :users, column: :created_by, primary_key: :id
  end
end
