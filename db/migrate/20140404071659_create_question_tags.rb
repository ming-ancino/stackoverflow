class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|

      t.timestamps
    end
  end
end
