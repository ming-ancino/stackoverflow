class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :answerer, :body
end
