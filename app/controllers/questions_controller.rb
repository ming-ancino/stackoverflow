class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end


  def show
    @question = Question.find(params[:id])
    @answers =@question.answers
    @comment = Answer.new
  end

  def new
    @question = Question.new :subject => 'Default Subject', :text => 'Default Text'
  end

  def create
    user = self.current_user
     @question = user.questions.build(params[:question])
    if @question.save
      redirect_to question_path(@question.id)
    else 
        render 'new'
    end
  end

  def edit
     @question = Question.find(params[:id])
     if self.current_user.id != @question.user_id
      redirect_to questions_path
     end
  end

  def update
     @question = Question.find(params[:id])

     if @question.update_attributes(params[:question])
        redirect_to question_path(@question.id)
     else
        render 'edit'
     end
  end

  def destroy
   @question = Question.find(params[:id])
   @question.destroy

   respond_to do |format|
     format.html { redirect_to(questions_path) }
     format.js 
   end
  end


  def search
    @search_string = params[:search]
    @questions = Question.search(@search_string)

    render :index
  end

end
