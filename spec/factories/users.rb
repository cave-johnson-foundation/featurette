# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Kao 'Ive' Felix"
    email "awesomemail@example.com"
    photo_url "https://en.gravatar.com/userimage/12809/003c3e38be106ef4b6c0ec78716a3d6c.jpeg"
    provider "facebook"
    uid "123456"
    access_token "AAbbCC"
  end
end
