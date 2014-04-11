class Vote < ActiveRecord::Base
  attr_accessible :answer_id, :username, :vote_value, :user_id
  belongs_to :voteable , :polymorphic => true

  def self.check_user(voteable, user_id)

    if voteable.votes.where(:user_id => user_id ).first != nil
        true
    else
        false
    end

  end

  def self.vote_value(voteable, user_id)
    voteable.votes.where(:user_id => user_id).first.vote_value
  end

end
