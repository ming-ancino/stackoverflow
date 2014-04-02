class Question < ActiveRecord::Base
  attr_accessible :subject, :text
  has_many :answers, :dependent => :destroy, :as => :container
  validates :subject, :presence => true,
                    :length => { :minimum => 5 }
end