class FeatureObserver < ActiveRecord::Observer
  def after_transition(feature, transition)
    if feature.succeeded?
      feature.donations.map(&:user).each do |user|
        NotificationsMailer.delay.feature_succeeded(feature.id, user.id)
      end
    end
  end
end
