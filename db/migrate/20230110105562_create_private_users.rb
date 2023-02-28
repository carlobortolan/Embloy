class CreatePrivateUsers < ActiveRecord::Migration[7.0]
  def change
      create_table :private_users, id: :integer, charset: "unicode", force: :cascade do |t|
      t.string :private_attr
      t.timestamps
    end
  end
end
