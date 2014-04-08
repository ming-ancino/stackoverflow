class AddUsernameToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :username, :string

  end
end
