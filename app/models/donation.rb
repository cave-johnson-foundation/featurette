class Donation < ActiveRecord::Base
  belongs_to :feature
  attr_accessible :amount
  validates_presence_of :amount
  before_save :add_amount_to_feature

  private
  def add_amount_to_feature
    feature.add_to_total_amount amount
  end
end
