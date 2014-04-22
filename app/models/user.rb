class User < ActiveRecord::Base

  attr_accessible :username, :password, :password_confirmation

  has_secure_password
  
  has_many :questions
  has_many :answers
  has_many :votes
  
end
