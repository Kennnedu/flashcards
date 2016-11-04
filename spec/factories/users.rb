FactoryGirl.define do
  factory :user do
    email "sasha@pupkin.com"
    current_deck 0
    password  '123456'
    password_confirmation '123456'
  end
end
