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
    event :accept do
      transition suggested: :financied, if: lambda {|feature| feature.succeeded?}
      transition suggested: :accepted
    end
    event :goal_reached do
      transition accepted: :financied
    end
  end

  def receive donation
    donations << donation
    goal_reached if succeeded?
  end

  def current_amount
    donations.map(&:amount).reduce(&:+)
  end

  def succeeded?
    goal <= current_amount if goal.present? && current_amount.present?
  end
end
