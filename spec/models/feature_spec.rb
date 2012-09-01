describe Feature do
  let(:feature) {Feature.new(current_amount: 10, goal: 0)}

  it { should respond_to :description }
  it { should belong_to :app }
  it "adds to total amount" do
    expect{feature.add_to_total_amount 100}.to change(feature, :current_amount).from(feature.current_amount).to(feature.current_amount+100)
  end
end
