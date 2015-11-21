class Importer

  def import
    # create users
    @user1 = FactoryGirl.create :user
    @user2 = FactoryGirl.create :user
    @user3 = FactoryGirl.create :user
    @user4 = FactoryGirl.create :user
    @user5 = FactoryGirl.create :user

    @users = FactoryGirl.create_list(:user, 10)

    # create photos
    @photo1 = FactoryGirl.create :photo, user: @user1
    @photo2 = FactoryGirl.create :photo, user: @user1
    @photo3 = FactoryGirl.create :photo, user: @user1
    @photo4 = FactoryGirl.create :photo, user: @user2
    @photo5 = FactoryGirl.create :photo, user: @user2
    @photo6 = FactoryGirl.create :photo, user: @user3
    @photo7 = FactoryGirl.create :photo, user: @user3
    @photo8 = FactoryGirl.create :photo, user: @user4
    @photo9 = FactoryGirl.create :photo, user: @user4
    @photo10 = FactoryGirl.create :photo, user: @user4
    @photo11 = FactoryGirl.create :photo, user: @user4
    @photo12 = FactoryGirl.create :photo, user: @user4

    # create funny votes
    @vote1 = FactoryGirl.create :funny_vote, user: @user1, photo: @photo1
    @vote2 = FactoryGirl.create :funny_vote, user: @user1, photo: @photo2
    @vote3 = FactoryGirl.create :funny_vote, user: @user1, photo: @photo3
    @vote4 = FactoryGirl.create :funny_vote, user: @user1, photo: @photo4
    @vote5 = FactoryGirl.create :funny_vote, user: @user1, photo: @photo5
    @vote6 = FactoryGirl.create :funny_vote, user: @user2, photo: @photo1
    @vote7 = FactoryGirl.create :funny_vote, user: @user3, photo: @photo1

    # create shameful votes
    @vote8 = FactoryGirl.create :shameful_vote, user: @user1, photo: @photo6
    @vote9 = FactoryGirl.create :shameful_vote, user: @user2, photo: @photo6
    @vote10 = FactoryGirl.create :shameful_vote, user: @user3, photo: @photo6
    @vote11 = FactoryGirl.create :shameful_vote, user: @user4, photo: @photo6
    # @vote12 = FactoryGirl.create :shameful_vote, user: @user1, photo: @photo11
    # @vote13 = FactoryGirl.create :shameful_vote, user: @user2, photo: @photo8

    # Create very funny photo
    @users.each do |user|
      FactoryGirl.create :funny_vote, photo: @photo5, user: user
    end

    # Create very shameful photo
    @users.each do |user|
      FactoryGirl.create :shameful_vote, photo: @photo7, user: user
    end
  end
end