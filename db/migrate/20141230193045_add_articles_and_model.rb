class AddArticlesAndModel < ActiveRecord::Migration
  def change
    create_table(:articles) do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.text :description, null: false
      t.integer :vote_count, null: false, default: 0
      t.timestamps

    end
  end
end
