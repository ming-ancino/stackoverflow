class AnswersController < ApplicationController
 http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    def create
      current_user = User.find(session[:user_id]).username
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(params[:answer].merge(:username => current_user))
      redirect_to question_path(@question)
    end

    def destroy
      @question = Question.find(params[:question_id])
      @answer = @question.answers.find(params[:id])
      @answer.destroy
      redirect_to question_path(@question)
    end

    def show
      answer = Answer.find(params[:id])
      current_user = User.find(session[:user_id]).username
      already_voted = Vote.check_user(answer, current_user)
      vote_type = params[:vote]
      if already_voted
        vote = answer.votes.find(:all, :conditions => ['username = ?', current_user]).first
        vote_value = Vote.vote_value(answer,current_user)
        if "Upvote" == vote_type && vote_value < 1
          vote.update_attributes(:vote_value =>   vote.vote_value + 1)
        elsif "Downvote" == vote_type && vote.vote_value > -1
         vote.update_attributes(:vote_value =>   vote.vote_value - 1)
       else
         #no updates
        end
      else
        if "Upvote" == vote_type 
          answer.votes.create(:username => current_user, :vote_value => 1 )
        else
          answer.votes.create(:username => current_user, :vote_value => -1 )
        end        

      end
      #Vote.insert_vote(params[:id], params[:vote], current_user)

      @question = Question.find(params[:question_id])
      redirect_to question_path(@question)
    end

    def update
      edit_answer = Answer.find(params[:id])
      current_user = User.find(session[:user_id]).username
      edit_answer.comments.create(params[:answer].merge(:username => current_user))

      @question = Question.find(params[:question_id])
      redirect_to question_path(@question)
    end
end
