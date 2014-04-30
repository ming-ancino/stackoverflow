shared_context 'when signed in', :signed_in => true do

  let(:curr_user) { FactoryGirl.create :user }

  before(:each) { session[:user_id] = curr_user.id }

end
