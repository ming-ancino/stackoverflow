class Answer < ActiveRecord::Base
  belongs_to :container, :polymorphic => true


  has_many :comments ,:class_name => 'Answer', :dependent => :destroy, :as => :container
  attr_accessible :answerer, :body
end
