class CreateQuestionTag < ActiveRecord::Migration
  def up
    remove_column :questions, :tags
    remove_column :tags, :question_id
  end

  def down
  end
end
