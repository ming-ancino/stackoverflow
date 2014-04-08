class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, :through => :question_tags
  attr_accessible :name

 # def self.search(search)
 #   if search && search != ""
 #     tag_search = Tag.find(:all, :conditions => ['name LIKE ?', "%#{search.strip}%"])
 #     question_array = [] 
 #     (tag_search.map { |tag| tag.questions }).map do |each_question|
 #       question_array = (question_array + each_question).uniq
 #     end
 #     question_array
 #   else
 #     Question.all
 #   end
 # end

end
