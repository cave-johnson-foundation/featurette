describe Feature do
  subject(:feature) { build :feature }

  it { should belong_to :app }
  it { should belong_to :user }
  it { should have_many :donations }

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

  describe '#current_amount' do
    context 'before receiving any donation' do
      its(:current_amount) { should eq 0.0 }
    end
    context 'after receiving some donations' do
      let(:ten_bucks) { build(:donation, amount: 10.0) }
      
      subject {build :feature, goal: 20.0, state: :accepted}

      before do
        2.times { subject.receive ten_bucks }
      end

      its(:current_amount) { should eq 20.0 }
      it {should be_financied}
    end
  end

  context "states" do
    it "goes from suggested to accepted" do
      pending 'nao rola'
      expect {feature.accept!}.to change(feature, :state).from('suggested').to('accepted')
    end
    it "can go straight from suggested to financied when it is accepted" do
      pending 'nao rola'
      feature.goal = 1
      feature.stub(:current_amount).and_return(100)
      expect{feature.accept!}.to change(feature, :state).from('suggested').to('financed')
    end
  end
end
