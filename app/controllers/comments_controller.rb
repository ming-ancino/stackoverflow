class CommentsController < ApplicationController
    def create
      @question = Question.find(params[:question_id])
      @answer =@question.find.(params[:answer_id])
      @comments = @answers.create(params[:id])
      redirect_to question_path(@question)
    end

    def destroy
      @question = Question.find(params[:question_id])
      @answer = @question.answers.find(params[:id])
      @answer.destroy
      redirect_to question_path(@question)
    end
end
