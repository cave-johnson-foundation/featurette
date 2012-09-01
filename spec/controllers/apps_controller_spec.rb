require 'spec_helper'

describe AppsController do
  describe '#index' do
    let(:apps) {[
      build(:app, name: 'Diaroogle'),
      build(:app, name: 'Twitter')
    ]}

    before do
      App.stub(:all).and_return apps
      get :index
    end

    it { assigns(:apps).should =~ apps }
    it { render_template :index }
  end
end
