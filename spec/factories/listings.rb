FactoryGirl.define do
  sequence(:name) { |n| "Listing Name #{n}" }

  factory :listing do
    name
    description "lorem ipsum etc etc"
    location "Toronto, ON"
    rent_date Time.now - 2.week
    price 900
    created_at Time.now
    association :user, factory: :test_user
  end
end
