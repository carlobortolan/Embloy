class CreateReviews < ActiveRecord::Migration[7.0]
  create_enum :rating_type, ["1", "2", "3", "4", "5"]
  create_table :reviews, primary_key: :user_id, id: :integer, charset: "unicode", force: :cascade do |t|
    t.enum :rating, enum_type: "rating_type", default: "1", null: false
    t.text :message
    t.integer :created_by, null: false
    t.timestamps
    t.index [:created_by], name: "reviews_created_by_index"
  end

end
