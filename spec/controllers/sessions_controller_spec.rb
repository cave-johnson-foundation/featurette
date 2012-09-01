require 'spec_helper'

describe SessionsController do
  render_views

  describe "GET create" do
    before(:each) do
      @user = Factory.create(:user, :provider => 'facebook', :uid => '352045851544065')
      request.env["omniauth.auth"] = {"provider"=>"facebook", "uid"=>"352045851544065", "credentials"=>{"token"=>"AAADvZADZBnlLABAMVZAUX1s7ptC0m9HZCaaIkMw8AMxFBtV3uZCmjflQDKba5PPt3kqZAgVlmZCeA6tXAUaBlLEInggas8lAGIzXzP4azfrsgZDZD"}, "info"=>{"nickname"=>nil, "email"=>"pnascimento@gmail.com", "first_name"=>"Pedro", "last_name"=>"Nascimento", "name"=>"Pedro Nascimento", "image"=>"http://graph.facebook.com/lunks/picture?type=square", "urls"=>{"Facebook"=>"http://www.facebook.com/profile.php?id=352045851544065", "Website"=>nil}}, "extra"=>{"user_hash"=>{"id"=>"352045851544065", "name"=>"Pedro Nascimento", "first_name"=>"Pedro", "last_name"=>"Nascimento", "link"=>"http://www.facebook.com/profile.php?id=352045851544065", "gender"=>"male", "email"=>"pnascimento@gmail.com", "timezone"=>-3, "locale"=>"pt_BR", "updated_time"=>"2012-09-01T16:20:20+0000"}}}
    end
    it "should set user id on session" do
      get :create, :provider => 'facebook'
      session[:user_id].should == @user.id
    end
    it "should redirect to root url" do
      get :create, :provider => 'facebook'
      response.should redirect_to(root_url)
    end
  end
  describe "GET failure" do
    it "should render template" do
      get :failure
      response.should redirect_to(root_url)
    end
    it "should set flash message" do
      get :failure
      flash[:alert].should == 'Could not authenticate, sorry.'
    end
  end
  describe "GET destroy" do
    it "should nuliffy user_id on sessions" do
      session[:user_id] = "1"
      get :destroy
      session[:user_id].should be_nil
    end
    it "should set flash message" do
      get :destroy
      flash[:notice].should == "User logged out."
    end
    it "should redirect to root url" do
      get :destroy
      response.should redirect_to(root_url)
    end
  end
end
