require_relative "spec_helper"

describe Vote do

  describe "associations" do

    before :each do
      @vote = Vote.new
      @photo = Photo.new
      @user = User.new
    end

    it "should be able to get its user" do
      expect{ @vote.user }.to_not raise_error
    end

    it "should be able to set its user" do
      expect{ @vote.user = @user }.to_not raise_error
    end

    it "should be able to get its photo" do
      expect{ @vote.photo }.to_not raise_error
    end

    it "should be able to set its photo" do
      expect{ @vote.photo = @photo }.to_not raise_error
    end

  end

  before :each do
    @user = FactoryGirl.create :user
    @photo = FactoryGirl.create :photo, user: @user
    @vote_user = FactoryGirl.create :user, username: "Voter"
  end

  describe "context" do

    it "can be shameful" do
      s_vote = FactoryGirl.build :shameful_vote, user: @vote_user, photo: @photo
      expect(s_vote).to be_valid
    end

    it "can be funny" do
      f_vote = FactoryGirl.build :funny_vote, user: @vote_user, photo: @photo
      expect(f_vote).to be_valid
    end

    it "cannot be anything other than funny or shameful" do
      invalid_context = FactoryGirl.build :funny_vote, user: @vote_user, photo: @photo, context: "Yay"
      expect(invalid_context).to_not be_valid
    end
    
  end

  it "should be unique for context" do
    first_vote = FactoryGirl.create :shameful_vote, user: @vote_user, photo: @photo
    second_vote = FactoryGirl.build :shameful_vote, user: @vote_user, photo: @photo
    expect(second_vote).to_not be_valid
  end

end