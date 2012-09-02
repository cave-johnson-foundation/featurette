describe Feature do
  subject { build :feature }

  it { should belong_to :app }
  it { should have_many :donations }
  it { should validate_presence_of :description }
  it { should validate_presence_of :name }

  describe '#receive' do
    let(:ten_bucks) { build(:donation, amount: 10.0) }
    before { subject.receive ten_bucks }
    its(:current_amount) { should eq 10.0 }
  end  
end
