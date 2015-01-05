class ChangeArticlesTable < ActiveRecord::Migration
  def change

    remove_column :articles, :vote_count

  end
end
