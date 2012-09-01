describe App do
  it { should respond_to :name }
  it { should respond_to :url }
  it { should have_many :features }
end
