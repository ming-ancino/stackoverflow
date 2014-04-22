class EditTables < ActiveRecord::Migration
  def up
     add_column :votes, :user_id, :integer
     add_column :answers, :user_id, :integer
     add_column :questions, :user_id, :integer
     remove_column :votes, :username
     remove_column :answers, :username
     remove_column :questions, :username
  end

  def down
  end
end
