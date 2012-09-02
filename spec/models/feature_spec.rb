describe Feature do
  subject { build :feature }

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
end
