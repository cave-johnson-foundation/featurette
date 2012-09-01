class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :feature
      t.decimal :amount

      t.timestamps
    end
    add_index :donations, :feature_id
  end
end
