# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feature do
    description "MyString"
    current_amount 0
    goal 0
    app
  end
end
