class EditColumnsOfVote < ActiveRecord::Migration
  def up
    add_column :votes, :voteable_id, :integer
    add_column :votes, :voteable_type, :string
    remove_column :votes, :answer_id
  end

  def down
  end
end
