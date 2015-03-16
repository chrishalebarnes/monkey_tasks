FactoryGirl.define do
  factory :user do
    email "monkey@monkeytasks.com"
    password_digest "$2a$10$JWSaLYpe09o6B9G1B9mXoOlbzBdqlJfvpGcCA/aerLp7iltDmn6jK" #hash of 'password'
  end
end