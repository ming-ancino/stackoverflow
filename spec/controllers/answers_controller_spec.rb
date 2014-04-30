require 'spec_helper'

describe AnswersController, :signed_in => true do
    describe '#create' do

    let(:question) { FactoryGirl.create :question }
    let(:action) {post :create, {question_id: question.id, :answer => FactoryGirl.attributes_for(:answer)}}

    it 'it should create answer' do
      expect{
        action
      }.to change(Answer, :count).by(1)
    end

   it 'assigns to @answer' do
      action
      expect(assigns :answer).not_to be_nil
    end

  end

   describe '#destroy' do
      let(:ques) { FactoryGirl.create :question }

      it 'it should delete the answer' do
        answer = FactoryGirl.create :answer, container: ques
        expect{
          delete :destroy, {question_id: ques.id,:id => answer.id}
        }.to change(Answer, :count).by(-1)
    end

  end
end
