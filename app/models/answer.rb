
 class Answer < ActiveRecord::Base
  belongs_to :container, :polymorphic => true
  belongs_to :user

  has_many :comments ,:class_name => 'Answer', :dependent => :destroy, :as => :container
  has_many :votes, :as => :voteable
  attr_accessible :user_id, :body

  def total_votes
    #total = 0
    #self.votes.map { |each_vote| total += each_vote.vote_value }
    #total
    self.votes.sum(&:vote_value)

  end

  def user_vote(current_user)
    vote_instance  = self.votes.where(:user_id => current_user).first
    if vote_instance != nil
      vote_instance.vote_value
    else
      0
    end
  end

end
