class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
