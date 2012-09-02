describe AppsController do
  let(:diaroogle) { build :app }
  let(:twitter) { build :app }
  let(:rich_one) { build :donation }
  let(:poor_one) { build :donation }

  describe '#index' do
    let(:apps) { [diaroogle, twitter] }
    let(:donations) { [rich_one, poor_one] }

    before do
      App.stub(:scoped).and_return apps
      Donation.stub(:latest).and_return donations
      get :index
    end

    it { should respond_with(:success) }
    it { assigns(:apps).should =~ apps }
    it { assigns(:latest_donations).should =~ donations }
    it { should render_template :index }
    it { should_not set_the_flash }
  end

  describe '#show' do
    before do
      App.stub(:find).with('42').and_return diaroogle
      get :show, id: 42
    end

    it { should respond_with(:success) }
    it { assigns(:app).should eq diaroogle }
    it { should render_template :show }
    it { should_not set_the_flash }
  end
end
