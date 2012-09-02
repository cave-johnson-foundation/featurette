class Feature < ActiveRecord::Base
  attr_accessible :app, :name, :description, :first_donation, :current_amount

  belongs_to :app
  belongs_to :user
  has_many :donations
  has_one :first_donation, class_name: Donation

  validates_presence_of :name
  validates_presence_of :description
  
  state_machine initial: :suggested do
    state :suggested
    state :accepted
    state :financied
    event :goal_reached do
      transition accepted: :financied
    end
  end

  def receive donation
    donations << donation
  end

  def current_amount
    donations.map(&:amount).reduce(&:+)
  end

  def first_donation
    if donations.empty?
      Donation.new(user: user, amount: 0.0)
    else  
      donations.find { |d| d.user == user }
    end  
  end

  def add_to_total_amount value
    update_attributes(current_amount: current_amount + value)
    if goal <= current_amount
      goal_reached
    end
  end
end
