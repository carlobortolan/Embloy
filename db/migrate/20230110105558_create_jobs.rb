class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_enum :job_status, ['public', 'private', 'archieved']
    create_table :jobs, primary_key: :job_id, id: :integer, charset: "unicode", force: :cascade do |t|
      t.string :job_type
      t.integer :job_status, limit: 1, default: 0
      t.enum :status, enum_type: "job_status", default: 'public', null: false
      t.integer :user_id, default: 0
      t.integer :duration, default: 0
      t.string :code_lang, limit: 2
      t.string :title, limit: 100
      t.string :position, limit: 100
      t.text :description
      t.string :key_skills, limit: 100
      t.integer :salary
      t.string :currency
      t.string :image_url, limit: 500
      t.datetime :start_slot, precision: nil
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.string :country_code, limit: 45
      t.string :postal_code, limit: 45
      t.string :city, limit: 45
      t.string :address, limit: 45
      t.integer :view_count, default: 0, null: false
      t.timestamps
      t.index [:job_id], name: "job_job_id_index"
      t.index [:user_id], name: "job_user_id_index "
      t.index [:country_code], name: " job_country_code_index "
      t.index [:postal_code], name: " job_postal_code_index "
    end
  end
end
