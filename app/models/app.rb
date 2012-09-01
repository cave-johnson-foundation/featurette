class App < ActiveRecord::Base
  attr_accessible :name, :url
  has_many :features
end
