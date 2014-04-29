shared_context 'when signed as admin', :signed_in => true do

  let(:user) { FactoryGirl.create :user }

  before(:each) { session[:user_id] = admin.id }

end
