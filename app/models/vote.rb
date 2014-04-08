class Vote < ActiveRecord::Base
  attr_accessible :answer_id, :username, :vote_value
  belongs_to :voteable , :polymorphic => true

  def self.check_user(voteable, username)

    if voteable.votes.find(:all, :conditions => ['username = ?', username]).first != nil
        true
    else
        false
    end

  end

  def self.vote_value(voteable, username)
     voteable.votes.find(:all, :conditions => ['username = ?',username]).first.vote_value
  end

end
