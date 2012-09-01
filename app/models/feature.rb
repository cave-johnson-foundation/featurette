class Feature < ActiveRecord::Base
  attr_accessible :description
  belongs_to :app
end
