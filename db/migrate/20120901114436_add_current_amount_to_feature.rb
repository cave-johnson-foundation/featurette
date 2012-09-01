class AddCurrentAmountToFeature < ActiveRecord::Migration
  def change
    add_column :features, :current_amount, :decimal
  end
end
