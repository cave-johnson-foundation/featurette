describe App do
  it { should respond_to :name }
  it { should respond_to :url }
  it { should have_many :features }
  it {should have_attached_file :logo}
  it {should have_attached_file :screenshot}
end
