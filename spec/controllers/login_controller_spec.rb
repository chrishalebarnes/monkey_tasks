require 'rails_helper'
require 'credentials'

RSpec.describe LoginController, type: :controller do  
  describe "GET #index" do
    it "should respond with success" do
      get :index
      expect(response).to be_success
    end

    it "should render the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "post login#login" do
    subject { post :login, email: Credentials::EMAIL, password: Credentials::PASSWORD }

    it "should redirect to /tasks if the login is successful" do
      FactoryGirl.create(:user)
      expect(subject).to redirect_to("/tasks")
    end

    it "should redirect to root if the login is not successful" do
      #don't create a user, so the login is rejected
      expect(subject).to redirect_to("/")
    end    
  end

  describe "get login#logout" do
    before(:each) do
      FactoryGirl.create(:user)
      post :login, email: Credentials::EMAIL, password: Credentials::PASSWORD
    end    

    subject { get :logout }

    it "should redirect to root after logout" do      
      expect(subject).to redirect_to("/")
    end
  end  
end