describe AppsController do
  let(:diaroogle) { build :app }
  let(:twitter) { build :app }

  describe '#index' do
    let(:apps) { [diaroogle, twitter] }

    before do
      App.stub(:all).and_return apps
      get :index
    end

    it { should respond_with(:success) }
    it { assigns(:apps).should =~ apps }
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
