require 'spec_helper'

describe Question do
  context "with 2 or more answers" do
    it "orders them in reverse chronologically" do
      question = Question.create!(:subject => "Sample Subject", :text =>"Sample body!")
      answer1 = question.answers.create!(:body => "first answer")
      answer2 = question.answers.create!(:body => "second answer")
      expect(question.reload.answers).to eq([answer1, answer2])
    end
  end
  # describe '#total_votes' do
  #   it 'returns total votes' do
  #   # setup
  #   question = Question.create!(:subject => "Sample Subject", :text =>"Sample body!")
  #   vote1 = question.votes.create!(:vote_value => 1, :user_id => 'user1' )
  #   vote2 = question.votes.create!(:vote_value => 1, :user_id => 'user2' )
  #   vote3 = question.votes.create!(:vote_value => -1, :user_id => 'user2' )
  #   # excercise and verify
  #   expect(question.name).to eq vote1+vote2+vote3
  # end

end
