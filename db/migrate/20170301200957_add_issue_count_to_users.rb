class AddIssueCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :issues_count, :integer
  end
end
