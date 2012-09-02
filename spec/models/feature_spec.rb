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

  describe '#first_donation' do
    let(:author) { subject.user }

    context 'for an existing feature' do
      let(:first) { build(:donation, user: author) }
      let(:second) { build(:donation) }

      before do
        [first, second].each do |donation|
          subject.receive donation
        end
      end

      its(:first_donation) { should eq first }
    end

    context 'for a brand new feature' do
      it 'should initialize an empty donation for the author' do
        subject.first_donation.user.should eq author
        subject.first_donation.amount.should eq 0.0
      end
    end
  end
end
