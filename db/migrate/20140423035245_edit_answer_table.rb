class EditAnswerTable < ActiveRecord::Migration
  def up
     add_column :answers, :type, :string
     remove_column :answers, :answerer
     remove_column :answers, :answer_id
  end

  def down
  end
end
