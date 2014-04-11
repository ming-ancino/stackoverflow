class QuestionsController < ApplicationController
   http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    def new
      @question = Question.new :subject => 'Default Subject', :text => 'Default Text'
    end

    def create
      user = session[:current_user]
      #user = User.find(session[:user_id])
       @question = user.questions.build(params[:question])
      # if @question.save
	     #  redirect_to question_path(@question.id)
      # else 
      #     render 'new'
      #  end
      respond_to do |format|
        if @question.save
          format.html { redirect_to question_path(@question.id) }
          format.js
        else
          format.html { render 'new' }
          format.js
        end
      end
    end
    

    def show
      #@current_user = session[:current_user].id
      @question = Question.find(params[:id])
    end

    def index
       @search_string = params[:search]
       @questions = Question.search(@search_string)

    end

    def edit
       @question = Question.find(params[:id])
       if session[:current_user].id != @question.user_id
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
 
     #redirect_to questions_path
      respond_to do |format|
        format.html { redirect_to(questions_path) }
        format.js   { render :nothing => true }
      end
  end

end
