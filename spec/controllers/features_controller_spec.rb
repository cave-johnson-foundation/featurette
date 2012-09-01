describe FeaturesController do
  let(:make_coffee) { build :feature }  
  
  describe '#show' do
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