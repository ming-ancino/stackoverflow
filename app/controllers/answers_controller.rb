class AnswersController < ApplicationController
 http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    def create
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(params[:answer].merge(:user_id => session[:current_user].id))
      #@answer = @question.answers.create(params[:answer].merge(session[:current_user]))
      #@answer = @question.answers.create(params[:answer])
      
      #@answer.user = session[:current_user]
      redirect_to question_path(@question)
    end

    def destroy
      @question = Question.find(params[:question_id])
      @answer = @question.answers.find(params[:id])
      @answer.destroy
      redirect_to question_path(@question)
    end

    def show
      @question = Question.find(params[:question_id])
      redirect_to question_path(@question)
    end

    def update
      edit_answer = Answer.find(params[:id])
      edit_answer.comments.create(params[:answer].merge(:user_id => session[:current_user].id))

      @question = Question.find(params[:question_id])
      redirect_to question_path(@question)
    end
end
