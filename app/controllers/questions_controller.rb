class QuestionsController < ApplicationController
 http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    def new
      @question = Question.new :subject => 'Default Subject', :text => 'Default Text'
    end

    def create
      current_user = User.find(session[:user_id]).username
      @question = Question.new (params[:question].merge(:username => current_user))
      if @question.save
	     redirect_to question_path(@question.id)
      else 
         render 'new'
      end
    end
    

    def show
      @current_user = User.find(session[:user_id]).username
      @question = Question.find(params[:id])
      already_voted = Vote.check_user(@question , @current_user)
      vote_type = params[:vote]
      if already_voted
        vote = @question.votes.find(:all, :conditions => ['username = ?', @current_user]).first
        vote_value = Vote.vote_value(@question,@current_user)
        if "Upvote" == vote_type && vote_value < 1
          vote.update_attributes(:vote_value =>   vote.vote_value + 1)
        elsif "Downvote" == vote_type && vote.vote_value > -1
         vote.update_attributes(:vote_value =>   vote.vote_value - 1)
       else
         #no updates
        end
      else
        if "Upvote" == vote_type 
          @question.votes.create(:username => @current_user, :vote_value => 1 )
        elsif "Downvote" == vote_type
          @question.votes.create(:username => @current_user, :vote_value => -1 )
        end        

      end
    end

    def index
       @current_user = User.find(session[:user_id]).username
       @search_string = params[:search]
       @questions = Question.search(@search_string)


    end

    def edit
       @question = Question.find(params[:id])
       if User.find(session[:user_id]).username != @question.username
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
 
     redirect_to questions_path
  end

end
