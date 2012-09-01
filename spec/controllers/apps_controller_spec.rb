require 'spec_helper'

describe AppsController do
  let(:diaroogle) { build :app }
  let(:twitter) { build :app }

  describe '#index' do
    let(:apps) { [diaroogle, twitter] }

    before do
      App.stub(:all).and_return apps
      get :index
    end

    it { assigns(:apps).should =~ apps }
    it { render_template :index }
  end

  describe '#show' do
    before do
      App.stub(:find).with('42').and_return diaroogle
      get :show, id: 42
    end

    it { assigns(:app).should eq diaroogle }
    it { render_template :show }
  end
end
