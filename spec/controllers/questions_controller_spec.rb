require 'spec_helper'

describe QuestionsController do
  let(:valid_attributes) { { :subject => "Subject", :text => "Text"} }

  let(:valid_session) { {} }

  describe "GET index" do
    # it "assigns all widgets as @widgets" do
    #   widget = Widget.create! valid_attributes
    #   get :index, {}, valid_session
    #   assigns(:widgets).should eq([widget])
    # end
  end

  describe "GET show" do
    it "assigns the requested question as @question" do
      user = User.new(:username => "user", :password => "user")
      question = Question.create! valid_attributes, user
      get :show, {:id => question.to_param}, valid_session
      assigns(:question).should eq(question)
    end
  end

end
