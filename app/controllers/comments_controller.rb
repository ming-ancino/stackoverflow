class CommentsController < ApplicationController
  def create
      @question = Question.find(params[:question_id])
      parent_answer = Answer.find(params[:answer_id])
      @comment = parent_answer.comments.create(params[:answer].merge(:user_id => self.current_user.id))
      @id = params[:answer_id]

     respond_to do |format|
       format.html { redirect_to question_path(@question) }
       format.js 
     end

  end
end
