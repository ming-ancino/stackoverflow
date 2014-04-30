FactoryGirl.define do

  # factory :answer do |answer|
  #   answer.body 'The quick brown fox jumps over the lazy dog.'
  #   answer.container {|c| c.association :question}
  # end

  factory :answer do
    body 'The quick brown fox jumps over the lazy dog.'
    association :container, factory: :question
    association :user
  end
end
