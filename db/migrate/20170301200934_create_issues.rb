class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :conservative_take
      t.string :liberal_take
      t.string :topic
      t.integer :user_id
      t.string :issue_name
      t.string :image

      t.timestamps

    end
  end
end
