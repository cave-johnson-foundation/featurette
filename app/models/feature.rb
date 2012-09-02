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
    goal_reached if goal <= current_amount
  end

  def current_amount
    donations.map(&:amount).reduce(&:+)
  end
end
