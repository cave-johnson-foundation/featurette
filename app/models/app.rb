class App < ActiveRecord::Base
  attr_accessible :name, :description, :url, :logo, :screenshot
  has_many :features
  has_attached_file :logo, :styles => { :medium => "238x238>",:thumb => "100x100>"}
  has_attached_file :screenshot, :styles => { :medium => "238x238>",:thumb => "100x100>", :large => "500x500>"}
end
