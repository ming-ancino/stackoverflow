class AddColumns < ActiveRecord::Migration
  def up
    add_column :question_tags, :question_id, :integer
    add_column :question_tags, :tag_id, :integer
  end

  def down
  end
end
