class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :users, :email_string, :username
  end

  def down
  end
end
