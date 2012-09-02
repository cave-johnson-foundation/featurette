FactoryGirl.define do
  factory :feature do
    description "Make Coffee"
    current_amount 0
    goal 0
    app
    after_build do |feature|
      feature.donations << FactoryGirl.build(:donation, feature: feature)
    end
  end
end
