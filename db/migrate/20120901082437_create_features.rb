class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :description
      t.integer :app_id

      t.timestamps
    end
  end
end
