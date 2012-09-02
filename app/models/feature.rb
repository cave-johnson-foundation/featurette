class Feature < ActiveRecord::Base
  attr_accessible :app, :user, :name, :description, :current_amount, :user_id

  belongs_to :app
  belongs_to :user
  has_many :donations

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
    unless donations.empty?
      donations.find { |d| d.user == user }
    else  
      Donation.new(user: user, amount: 0.0)
    end  
  end

  # acho que nao precisa
  def add_to_total_amount value
    update_attributes(current_amount: current_amount + value)
    if goal <= current_amount
      goal_reached
    end
  end
end
