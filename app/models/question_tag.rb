class QuestionTag < ActiveRecord::Base

  attr_accessible :tag_id, :question_id
  
  belongs_to :question
  belongs_to :tag
  
end
