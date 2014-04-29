shared_context 'when signed in', :signed_in => true do

  let(:user) { FactoryGirl.create :user }

  before(:each) { session[:user_id] = user.id }

end
