FactoryGirl.define do
  factory :first_comment, class: 'Comments' do
    body "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."
    association :user, factory: :test_user

  end
end
