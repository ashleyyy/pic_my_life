require './spec_helper'

describe User do

  describe "associations" do

    before :each do
      @user = User.new
    end

    it "should be able to get its votes" do
      expect { @user.votes }.to_not raise_error 
    end

    it "should be able to set its votes" do
      expect { @user.votes.new }.to_not raise_error
    end

    it "should be able to get its photos" do
      expect { @user.photos }.to_not raise_error
    end

    it "should be able to set its photos" do
      expect { @user.photos.new }.to_not raise_error
    end

  end

  before :each do
    @user = FactoryGirl.build :user
  end

  describe "password" do

    it "is required" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

  end

  describe "password_confirmation" do

    it "is required" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "should match the password" do
      @user.password_confirmation = "mismatch"
      expect(@user).to_not be_valid
    end
  end

  describe "username" do

    it "is required" do
      @user.username = nil
      expect(@user).to_not be_valid
    end

    it "should be unique" do
      older_user = FactoryGirl.create(:user)
      @user.username = older_user.username
      expect(@user).to_not be_valid
    end

  end

end