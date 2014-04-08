class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :password, :password_confirmation
  has_many :questions
  has_many :answers
  has_many :votes
end
