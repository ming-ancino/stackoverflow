class AnswersController < ApplicationController
 http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    def create
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(params[:answer])
      redirect_to question_path(@question)
    end

    def destroy
      @question = Question.find(params[:question_id])
      @answer = @question.answers.find(params[:id])
      @answer.destroy
      redirect_to question_path(@question)
    end
end
