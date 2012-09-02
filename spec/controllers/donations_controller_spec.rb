describe DonationsController do
  let(:app) { create :app }
  let(:feature) { create :feature, app: app }
  let(:user) { create :user }
  
  before { session[:user_id] = user }

  describe '#new' do
    before { get :new, app_id: app.id, feature_id: feature.id }

    it { should respond_with(:success) }
    it { assigns(:donation).should be_a_new Donation }
    it { should render_template :new }
    it { should_not set_the_flash }
  end

  describe '#create' do
    let(:params) {{ 
      amount: '10', 
      feature_id: feature.id,
      user_id: user.id
    }}

    before { post :create, app_id: app.id, feature_id: feature.id, donation: params }

    it { should respond_with(302) }
    it { should redirect_to app_feature_path(feature.app, feature) }
    it { should set_the_flash.to('Donation offered!') }
  end
end
