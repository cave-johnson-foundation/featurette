require 'spec_helper'

describe User do
  it { should have_many :donations }
  it { should have_many :features }


  describe "find_or_create_with_omniauth" do
        let(:auth) {
          {"provider"=>"facebook","uid"=>"123456","credentials"=> {"token"=>"MAOEEE"},"info"=>{"nickname"=>"lunks","email"=>"pnascimento@gmail.com","first_name"=>"Pedro","last_name"=>"Nascimento","name"=>"Pedro Nascimento","image"=>"http://graph.facebook.com/lunks/picture?type=square","urls"=>{"Facebook"=>"http://www.facebook.com/lunks", "Website"=>nil}}, "extra"=>{"user_hash"=>{"id"=>"750580364", "name"=>"Pedro Nascimento", "first_name"=>"Pedro", "last_name"=>"Nascimento", "link"=>"http://www.facebook.com/lunks", "username"=>"lunks","location"=>{"id"=>"110346955653479", "name"=>"Rio de Janeiro, Rio de Janeiro"}}}, "gender"=>"male", "email"=>"pnascimento@gmail.com", "timezone"=>-3, "locale"=>"pt_BR", "verified"=>true, "updated_time"=>"2012-09-01T00:04:30+0000"}}


    context "user doesnt exists" do
      describe "creating a new user" do
        it "should create" do
          expect {
            User.find_or_create_with_omniauth(auth)
          }.to change(User, :count).by(1)
        end
      end

      describe "setting data on new user" do
        subject { User.find_or_create_with_omniauth(auth) }

        it { subject.provider.should == "facebook" }
        it { subject.uid.should == "123456" }
        it { subject.name.should == "Pedro Nascimento" }
        it { subject.email.should == "pnascimento@gmail.com" }
        it { subject.access_token.should == "MAOEEE" }
        it { subject.photo_url.should == "http://graph.facebook.com/lunks/picture?type=square" }
      end
    end

    context "user already exists" do
      let!(:existing_user) { FactoryGirl.create(:user, :name => "My old name", :email => "my@old.me", :provider => "facebook", :uid => "123456")}
      
      describe "finding existing user" do

        it "should find" do
          User.find_or_create_with_omniauth(auth).should == existing_user
        end
      
        it "should not create" do
          expect {
            User.find_or_create_with_omniauth(auth)
          }.to_not change(User, :count)
        end
      end

      describe "updating existing user" do
        before do
          User.find_or_create_with_omniauth(auth)
        end

        subject { existing_user.reload }

        it { subject.provider.should == "facebook" }
        it { subject.uid.should == "123456" }
        it { subject.name.should == "Pedro Nascimento" }
        it { subject.email.should == "pnascimento@gmail.com" }
        it { subject.access_token.should == "MAOEEE" }
        it { subject.photo_url.should == "http://graph.facebook.com/lunks/picture?type=square" }
      end
    end
  end
end
