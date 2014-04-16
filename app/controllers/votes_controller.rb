class VotesController < ApplicationController
  # def create

  #   current_user = session[:current_user].id
  #   question_id = params[:question_id]
  #   if("Question" == type)
  #     voteable = Question.find(question_id) 
  #     @question = voteable
  #   else
  #     answer_id = params[:answer_id]
  #     voteable = Answer.find(answer_id)
  #     question_id = voteable.container.id
  #     @answer = voteable
  #   end

    
  #   already_voted = Vote.check_user(voteable , current_user)
  #   vote_type = params[:vote]
  #   if already_voted
  #     vote = voteable.votes.where(:user_id => current_user).first
  #     vote_value = Vote.vote_value(voteable,@current_user)
  #     if "Upvote" == vote_type && vote_value < 1
  #       vote.update_attributes(:vote_value =>   vote.vote_value + 1)
  #     elsif "Downvote" == vote_type && vote.vote_value > -1
  #       vote.update_attributes(:vote_value =>   vote.vote_value - 1)
  #     else
  #       #no updates
  #      end
  #    else
  #     if "Upvote" == vote_type 
  #       voteable.votes.create(:user_id=> current_user, :vote_value => 1 )
  #     elsif "Downvote" == vote_type
  #       voteable.votes.create(:user_id => current_user, :vote_value => -1 )
  #     end        

  #   end

  #   respond_to do |format|
  #     format.html { redirect_to question_path(question_id)}
  #     format.js   { render :layout => false }
  #   end

  # end

  def vote
    user = self.current_user.id
    params[:type] == 'question' ? @question = Question.find(params[:vid]) : @answer = Answer.find(params[:vid])
    @question.present? ? voteable = @question : voteable = @answer

    Vote.calculate_vote(voteable,user,params[:vote].to_i)

    params[:type] == 'question' ?  (render :partial => '/questions/vote') : (render :partial => '/answers/vote')

  end

end