class AnswersController < ApplicationController
 http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

    def show
      @question = Question.find(params[:question_id])
      redirect_to question_path(@question)
    end

    def create
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(params[:answer].merge(:user_id => self.current_user.id))
      @comment = Answer.new
     
      respond_to do |format|
       format.html { redirect_to question_path(@question) }
       format.js 
      end

    end

    def update
      edit_answer = Answer.find(params[:id])
      edit_answer.comments.create(params[:answer].merge(:user_id => session[:current_user].id))

      @question = Question.find(params[:question_id])
      redirect_to question_path(@question)
    end

    def destroy
      @question = Question.find(params[:question_id])
      @answer = @question.answers.find(params[:id])
      @answer.destroy
      respond_to do |format|
         format.html { redirect_to question_path(@question) }
         format.js
       end
    end

end
