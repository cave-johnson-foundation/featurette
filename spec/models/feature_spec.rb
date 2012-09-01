describe Feature do
  it { should respond_to :description }
  it { should belong_to :app } 
end
