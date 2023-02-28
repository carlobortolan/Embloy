class CreateCurrents < ActiveRecord::Migration[7.0]
  def change
    create_table :currents, charset: "unicode", force: :cascade do |t|
      t.datetime :created_at, default: DateTime.now, null: false
      t.datetime :updated_at, default: DateTime.now, null: false
    end
  end
end
