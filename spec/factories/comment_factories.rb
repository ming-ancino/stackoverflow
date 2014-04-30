FactoryGirl.define do

  factory :comment, class: Comment, parent: :answer do
    association :container, factory: :answer
  end

end