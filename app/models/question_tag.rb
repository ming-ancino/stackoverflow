class QuestionTag < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag
  attr_accessible :tag_id, :question_id
end
