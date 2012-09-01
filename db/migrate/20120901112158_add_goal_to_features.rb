class AddGoalToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :goal, :decimal
  end
end
