require 'spec_helper'

describe CommentsController,:signed_in => true do
    describe '#create' do

    let(:question) { FactoryGirl.create :question }
    let(:answer) {FactoryGirl.create :answer, container: question}
    let(:action) {post :create, {question_id: question.id, answer_id: answer.id, :answer => FactoryGirl.attributes_for(:comment)}}

    it 'it should create comment' do
      expect{
        action
      }.to change(Comment, :count).by(1)
    end

   it 'assigns to @comment' do
      action
      expect(assigns :comment).not_to be_nil
    end

  end

end
