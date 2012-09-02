require "spec_helper"

describe NotificationsMailer do
  let(:donation) {build_stubbed :donation}
  let(:feature) {build_stubbed :feature}
  let(:user) {build_stubbed :user}
  before do
    User.stub(:find).and_return(user)
    Feature.stub(:find).and_return(feature)
    Donation.stub(:find).and_return(donation)
  end
  describe "donated" do
    let(:mail) { NotificationsMailer.donated(donation.id, user.id) }


    it "renders the headers" do
      mail.subject.should eq("You have donated 10.0 to a feature - Featurette")
      mail.to.should eq([user.email])
      mail.from.should eq(["cavejohnson@example.com"])
    end

    it "renders the body" do
      #just make sure we dont have any errors
      mail.body.encoded
    end
  end

  describe "feature_succeeded" do
    let(:mail) { NotificationsMailer.feature_succeeded(feature.id, user.id) }

    it "renders the headers" do
      mail.subject.should eq("Congratulations! A feature you have donated to will be implemented! - Featurette")
      mail.to.should eq([user.email])
      mail.from.should eq(["cavejohnson@example.com"])
    end

    it "renders the body" do
      #just make sure we dont have any errors
      mail.body.encoded
    end
  end

end
