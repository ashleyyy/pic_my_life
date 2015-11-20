ENV["RACK_ENV"] = "test"

require "rspec"
require "rack/test"
require "./config/environment"
require "./app/actions"
require_relative "spec_helper"


describe "Sinatra App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET '/'" do

    it "loads home page" do
      get "/"
      expect(last_response).to be_ok
    end

    it "displays home page content" do
      get "/"
      expect(last_response.body).to include("Home Page")
    end
  end
 
  describe "GET '/photos'" do

    it "loads photos page" do
      get "/photos"
      expect(last_response).to be_ok
    end

    it "displays photos content" do
      get "/photos"
      expect(last_response.body).to include("All Pics")
    end
  end

  describe "GET '/photos/new'" do
    
    it "loads new photo page" do
      get "/photos/new"
      expect(last_response).to be_ok
    end

    it "loads new photo content" do
      get "/photos/new"
      expect(last_response.body).to include("Post a Picture")
    end
  end

  describe "POST '/photos'" do
    #TODO : how to test post requests that need a current_user
    it "creates a photo instance" do
      @user = User.create(username: "alberta", password: "password", password_confirmation: "password")
      post '/signin', { user: { username: "alberta", password: "password"}}
      post '/photos', { photo: { url: "http://www.google.com", caption: "Searching" } }
    end
  end

  describe "GET '/photos/:id'" do

    it "loads individual photo page" do
      @photo = FactoryGirl.create :photo
      get "/photos/#{@photo.id}"
      expect(last_response.body).to include(@photo.url)
    end
  end

  describe "GET '/signup'" do

    it "loads signup page" do
      get "/signup"
      expect(last_response).to be_ok
    end

    it "displays signup page content" do
      get "/signup"
      expect(last_response.body).to include("Sign Up")
    end
  end

  describe "POST '/signup'" do
  end

  describe "GET '/signin'" do

    it "loads signin page" do
      get "/signin"
      expect(last_response).to be_ok
    end

    it "loads signin page content" do
      get "/signin"
      expect(last_response.body).to include("Sign In")
    end
  end

  describe "POST '/signin'" do
  end

  describe "GET '/signout'" do

    it "redirects to photos page" do
      get "/signout"
      expect(last_response.redirect?).to be true
      follow_redirect!
      expect(last_request.url).to eq("http://example.org/photos")
    end

  end

  describe "POST '/photos/:id/votes'" do
  end

end