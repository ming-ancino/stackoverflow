class AnswersController < ApplicationController



    def create
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(params[:answer].merge(:user_id => self.current_user.id))
      @comment = Answer.new
     
      respond_to do |format|
       format.html { redirect_to question_path(@question) }
       format.js 
      end

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
