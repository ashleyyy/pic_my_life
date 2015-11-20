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
    @photo1 = FactoryGirl.create :photo, user: @user1, url: 'http://i.imgur.com/f7B9meF.png'
    @photo2 = FactoryGirl.create :photo, user: @user1, url: 'http://i.imgur.com/59jMmt0.jpg'
    @photo3 = FactoryGirl.create :photo, user: @user1, url: 'http://i.imgur.com/GT12Dxk.jpg'
    @photo4 = FactoryGirl.create :photo, user: @user2, url: 'http://i.imgur.com/cbxBg.jpg'
    @photo5 = FactoryGirl.create :photo, user: @user2, url: 'http://i.imgur.com/3yz8W.jpg'
    @photo6 = FactoryGirl.create :photo, user: @user3, url: 'http://i.imgur.com/uR6pe.jpg'
    @photo7 = FactoryGirl.create :photo, user: @user3, url: 'http://i.imgur.com/1QyvYbd.jpg'
    @photo8 = FactoryGirl.create :photo, user: @user4, url: 'http://i.imgur.com/tHTZ15q.jpg'
    @photo9 = FactoryGirl.create :photo, user: @user4, url: 'http://i.imgur.com/y405w2k.jpg'
    @photo10 = FactoryGirl.create :photo, user: @user4, url: 'http://i.imgur.com/JMsMaty.jpg'
    @photo11 = FactoryGirl.create :photo, user: @user4, url: 'http://i.imgur.com/V9IMBIr.jpg'
    @photo12 = FactoryGirl.create :photo, user: @user4, url: 'http://i.imgur.com/oJOSj21.jpg'

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
    @vote12 = FactoryGirl.create :shameful_vote, user: @user1, photo: @photo11
    @vote13 = FactoryGirl.create :shameful_vote, user: @user2, photo: @photo8

    # Create very funny photo
    @users.each do |user|
      FactoryGirl.create :funny_vote, photo: @photo10, user: user
    end

    # Create very shameful photo
    @users.each do |user|
      FactoryGirl.create :shameful_vote, photo: @photo7, user: user
    end
  end
end