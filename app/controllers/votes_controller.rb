class VotesController < ApplicationController

  def create
    params[:answer_id] == nil  ? @question = Question.find(params[:question_id]) : @answer = Answer.find(params[:answer_id])
    @question.present? ? voteable = @question : voteable = @answer
    voteable.votes.create(:user_id => self.current_user.id, :vote_value => params[:vote_value])
    @vid = voteable.id
  
    respond_to do |format|
         format.html { redirect_to question_path(@question) }
         format.js
    end
  end

  def destroy
    vote = Vote.find(params[:id])
    if vote.voteable_type ==  'Question' 
      @question = vote.voteable
    else
      @answer = vote.voteable
      @question = @answer.container
      @vid = @answer.id
    end
    vote.destroy

    respond_to do |format|
     format.html { redirect_to(questions_path) }
     format.js 
    end
  end
end
