FactoryGirl.define do
  factory :refinery_user, class: Refinery::User do
    sequence(:username){|n| "name#{n}" }
    sequence(:email){|n| "email#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end
