class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo_url
      t.string :uid
      t.string :access_token
      t.string :provider

      t.timestamps
    end
  end
end
