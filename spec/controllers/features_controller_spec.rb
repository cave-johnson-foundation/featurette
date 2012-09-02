describe FeaturesController do
  let(:app) { create :app }
  
  describe '#new' do
    before { get :new, app_id: app.id }

    it { should respond_with(:success) }
    it { assigns(:feature).should be_a_new Feature }
    it { should render_template :new }
    it { should_not set_the_flash }
  end

  describe '#show' do
    let(:make_coffee) { build :feature }

    before do
      Feature.stub(:find).with('13').and_return make_coffee
      get :show, app_id: app.id, id: 13
    end

    it { should respond_with(:success) }
    it { assigns(:feature).should eq make_coffee }
    it { should render_template :show }
    it { should_not set_the_flash }
  end

  describe '#create' do
    let(:user) { create :user }
    let(:params) {{ 
      name: 'Free Access', 
      description: 'No bills.',
      app_id: app.id
    }}


    before do
      session[:user_id] = user.id
      post :create, app_id: app.id, feature: params
    end

    it { should respond_with(302) }
    it { should redirect_to action: :show, id: assigns(:feature).id }
    it { should set_the_flash.to('Feature suggested!') }
  end
end