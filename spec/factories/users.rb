FactoryGirl.define do
  sequence(:email) { |n| "#{n}@test"}

  factory :test_user, class: "User" do
    name 'Test'
    email
    role 'default'
    password 'password'
    password_confirmation 'password'
    message_notifications false
    to_create {|instance| instance.save(validate: false) }
  end
  # factory :user do
    # id { sequence }
    # username { "admin" }
    # password { "admin" }
    # email { "whatever@whatever.com" }
    # salt { "asdasdastr4325234324sdfds" }
    # crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("secret",
    #                    "asdasdastr4325234324sdfds") }
 # end
end
