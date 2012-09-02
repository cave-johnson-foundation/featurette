class Donation < ActiveRecord::Base
  attr_accessible :amount, :feature, :user, :feature_id, :user_id

  belongs_to :user
  belongs_to :feature

  validates_presence_of :amount

  scope :latest, limit(5).order("updated_at desc").includes(:feature => :app).includes(:user)
end
