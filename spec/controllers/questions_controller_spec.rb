require 'spec_helper'

describe QuestionsController, :signed_in => true do

  describe '#index' do

    let(:action) { get :index }
    let(:collection) { assigns :questions }

    before :all do
      FactoryGirl.create_list :question, 2
    end

    it 'renders the index template' do
      action
      expect(response).to render_template(:index)
    end

    it 'assigns to @questions' do
      action
      expect(collection).not_to be_empty
    end

    after :all do
      Question.destroy_all
    end

  end


  describe '#show' do

    let(:question) { FactoryGirl.create :question }
    let(:action) { get :show, :id => question.id }

    it 'renders the show template' do
      action
      expect(response).to render_template(:show)
    end

    it 'assigns to @question' do
      action
      expect(assigns :question).not_to be_nil
    end

    after :all do
      Question.destroy_all
    end
  end

  describe '#new' do

    let(:action) { get :new}

    it 'renders the new template' do
      action
      expect(response).to render_template(:new)
    end

    it 'assigns to @question' do
      action
      expect(assigns :question).not_to be_nil
    end

    after :all do
      Question.destroy_all
    end

  end

  describe '#create' do

    let(:action) { post :create, question: FactoryGirl.attributes_for(:question)}

    it 'it should create question' do
      expect{
        action
      }.to change(Question, :count).by(1)
    end

    it 'should redirect to the question' do
      action
      expect(response).to redirect_to Question.last
    end

    after :all do
      Question.destroy_all
    end
  end

  describe '#edit' do

    let(:question) { FactoryGirl.create :question, user: curr_user}
    let(:action) { get :edit, :id => question.id }

    it 'renders the edit template' do
      action
      expect(response).to render_template(:edit)
    end

    it 'assigns to @question' do
      action
      expect(assigns :question).not_to be_nil
    end

    after :all do
      Question.destroy_all
    end
  end

  describe '#update' do

    it 'it should update the question' do
      question =  FactoryGirl.create :question
      put :update, :id => question.id, :subject => "new subject", :text => "new text"
      expect(response).to redirect_to question_path(question.id)
    end

    after :all do
      Question.destroy_all
    end
  end

    describe '#destroy' do
      let(:question) { FactoryGirl.create :question }

      it 'it should delete the question' do

        expect{
          FactoryGirl.create_list :question, 2
          question
          delete :destroy, :id => question.id
        }.to change(Question, :count).by(2)
    end

  end

end
