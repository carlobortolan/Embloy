class CreateCompanyUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :company_users, id: :integer, charset: "unicode", force: :cascade do |t|
      t.string :company_name
      t.timestamps
    end
  end
end
