describe Donation do
  pending 'foo'
  it { should validate_presence_of :amount }
  it { should belong_to :feature }
  
  context "paying money to a feature" do
    subject(:donation) { build :donation, feature: create(:feature, goal: 300, state: :accepted) }
    
    it "sets feature to financied" do
    pending 'bla'
      donation.amount = 300
      expect{donation.save}.to change(donation.feature, :financied?).from(false).to(true)
    end
  end
end