class AddStateToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :state, :string
  end
end
