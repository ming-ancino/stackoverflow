FactoryGirl.define do

  factory :user do
    username :sample
    password :password
    password_confirmation :password
  end

end
