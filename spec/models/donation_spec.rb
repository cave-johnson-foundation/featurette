describe Donation do
  it { should belong_to :feature }
  it { should belong_to :user }

  it { should validate_presence_of :amount }

  context "scopes" do
    it "retrieves just the latest 5 donations" do
      create_list(:donation, 6)
      Donation.latest.size.should == 5
    end
  end
end
