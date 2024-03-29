class User < ActiveRecord::Base
  has_many :donations
  has_many :features

  def self.find_or_create_with_omniauth(auth)
    user = self.find_or_create_by_provider_and_uid(auth["provider"], auth["uid"])
    user.assign_attributes({
      :name => auth["info"]["name"], 
      :email => auth["info"]["email"], 
      :photo_url => auth["info"]["image"], 
      :access_token => auth["credentials"]["token"]}, 
      :without_protection => true)
    user.save(:validate => false)
    user
  end
end
