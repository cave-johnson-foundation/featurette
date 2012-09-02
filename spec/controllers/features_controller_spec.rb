describe FeaturesController do
  
  describe '#new' do
    let(:diaroogle) { build :app }

    before do
      App.stub(:find).with('42').and_return diaroogle
      get :new, app_id: 42
    end

    it { should respond_with(:success) }
    it { assigns(:app).should eq diaroogle }
    it { assigns(:feature).should be_a_new Feature }
    it { should render_template :new }
    it { should_not set_the_flash }
  end

  describe '#show' do
    let(:make_coffee) { build :feature }

    before do
      Feature.stub(:find).with('13').and_return make_coffee
      get :show, app_id: 42, id: 13
    end

    it { should respond_with(:success) }
    it { assigns(:feature).should eq make_coffee }
    it { should render_template :show }
    it { should_not set_the_flash }
  end
end