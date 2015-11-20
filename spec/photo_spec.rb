require "./spec_helper"

describe Photo do

  describe "associations" do

    before :each do
      @user = User.new
      @photo = Photo.new
    end

    it "should be able to get its user" do
      expect { @photo.user }.to_not raise_error
    end

    it "should be able to set its user" do
      expect { @photo.user = @user }.to_not raise_error
    end

    it "should be able to get its votes" do
      expect { @photo.votes }.to_not raise_error
    end

    it "should be able to set its votes" do
      expect { @photo.votes.new }.to_not raise_error
    end

  end

  before :each do
    @user = FactoryGirl.create :user
    @photo = FactoryGirl.create :photo, user: @user
  end

  describe "url" do

    it "should be required" do
      @photo.url = nil
      expect(@photo).to_not be_valid
    end

  end

  describe "user_id" do

    it "should be required" do
      @photo.user_id = nil
      expect(@photo).to_not be_valid
    end

    it "should be an integer" do
      @photo.user_id = "H"
      expect(@photo).to_not be_valid
    end

  end

end