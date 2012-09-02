class Donation < ActiveRecord::Base
  attr_accessible :amount, :user, :user_id

  belongs_to :user
  belongs_to :feature

  validates_presence_of :amount
  
  #before_save :add_amount_to_feature

  # private
  # def add_amount_to_feature
  #   feature.add_to_total_amount amount
  # end
end
