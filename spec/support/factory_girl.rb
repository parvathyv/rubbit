require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :article do
    sequence(:name) {|n| "article#{n}" }
    url 'www.stackoverflow.com'
    description 'Lies and the lying liars who tell them.'
    vote_count 0
  end

end
