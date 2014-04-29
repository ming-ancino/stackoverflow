require 'spec_helper'

describe QuestionsController, :signed_in => true do

  let(:valid_attributes) { { :subject => "Subject", :text => "Text"} }
  let(:valid_session) { {} }


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
  end

end
