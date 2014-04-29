FactoryGirl.define do

  factory :question do
    subject 'Who are you?'
    text 'The quick brown fox jumps over the lazy dog.'
    association :user
  end

end
