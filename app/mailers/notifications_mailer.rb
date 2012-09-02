class NotificationsMailer < ActionMailer::Base
  default from: "cavejohnson@example.com"

  def donated(donation_id, user_id)
    @donation = Donation.find(donation_id)
    @user = User.find(user_id)

    mail to: "#{@user.name} <#{@user.email}>", subject: "You have donated #{@donation.amount} to a feature - Featurette"
  end

  def feature_succeeded(feature_id, user_id)
    @feature = Feature.find(feature_id)
    @user = User.find(user_id)

    mail to: "#{@user.name} <#{@user.email}>", subject: "Congratulations! A feature you have donated to will be implemented! - Featurette"
  end
end
