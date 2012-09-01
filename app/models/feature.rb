class Feature < ActiveRecord::Base
  attr_accessible :description, :current_amount, :goal
  belongs_to :app
  state_machine initial: :suggested do
    state :suggested
    state :accepted
    state :financied
    event :goal_reached do
      transition accepted: :financied
    end
  end
  def add_to_total_amount value
    update_attributes(current_amount: value)
    if goal <= current_amount
      goal_reached
    end
  end
end
