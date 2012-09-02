describe Feature do
  subject { build :feature }

  it { should belong_to :app }
  it { should have_many :donations }
  it { should validate_presence_of :description }
  it { should validate_presence_of :name }

  
end
