class Question < ActiveRecord::Base
  attr_accessible :username, :subject, :text, :tags_used
  belongs_to :user
  has_many :answers, :dependent => :destroy, :as => :container
  has_many :question_tags
  has_many :tags, :through => :question_tags
  has_many :votes, :as => :voteable
  validates :subject, :presence => true,
                    :length => { :minimum => 5 }
  def tags_used
     self.tags.map { |t| t.name }.join(", ")
   end

   def tags_used=(list)
     tag_names = list.split(/,/)
     self.tags = tag_names.map { |name| Tag.where('name = ?', name).first or Tag.create(:name => name) }
   end  

  def self.search(search)
    if search && search != ""
      tag_search = Tag.find(:all, :conditions => ['name LIKE ?', "%#{search.strip}%"])
      question_array = [] 
      (tag_search.map { |tag| tag.questions }).map do |each_question|
        question_array = (question_array + each_question).uniq
      end
      question_array
    else
      Question.all
    end
  end

  def total_votes
    self.votes.sum(&:vote_value)
  end

  def user_vote(current_user)
    vote_instance  = self.votes.find(:all, :conditions => ['username = ?', current_user]).first
    if vote_instance != nil
      vote_instance.vote_value
    else
      0
    end
  end

end