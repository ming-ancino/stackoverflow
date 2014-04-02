class QuestionsController < ApplicationController
 http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    def new
      @question = Question.new :subject => 'Default Subject', :text => 'Default Text'
    end
    
    def create
      @question = Question.new params[:question]
      if @question.save
	 redirect_to question_path(@question.id)
      else 
         render 'new'
      end
    end
    

    def show
       @question = Question.find(params[:id])
    end

    def index
       @questions = Question.all
    end

    def edit
       @question = Question.find(params[:id])
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
 
     redirect_to questions_path
  end

end
