describe Feature do
  subject(:feature) { build :feature }

  it { should belong_to :app }
  it { should belong_to :user }
  it { should have_many :donations }

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

  describe '#receive' do
    subject {build :feature, goal: 20.0, state: :accepted}
    let(:ten_bucks) { build(:donation, amount: 10.0) }

    before do
      2.times { subject.receive ten_bucks }
    end

    its(:current_amount) { should eq 20.0 }
    it {should be_financied}
  end
  context "states" do
    it "goes from suggested to accepted" do
      expect {feature.accept!}.to change(feature, :accepted?).from(false).to(true)
    end
    it "can go straight from suggested to financied when it is accepted" do
      feature.goal = 1
      feature.stub(:current_amount).and_return(100)
      expect{feature.accept!}.to change(feature, :financied?).from(false).to(true)
    end
  end
end
