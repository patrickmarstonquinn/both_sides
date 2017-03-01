class CreateFavoriteIssues < ActiveRecord::Migration
  def change
    create_table :favorite_issues do |t|
      t.integer :issue_id
      t.integer :user_id

      t.timestamps

    end
  end
end
