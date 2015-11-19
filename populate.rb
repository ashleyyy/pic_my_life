require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

require 'active_record'
require 'factory_girl'
require 'faker'
require 'database_cleaner'

require './app/models/user'
require './app/models/photo'
require './app/models/vote'

require './factories/photos_factory'
require './factories/users_factory'
require './factories/votes_factory'

# Connect to the DB
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/db.sqlite3'
)

# Recreate the database
ActiveRecord::Migration.suppress_messages do
  require './db/schema.rb'
end

# create users
@user1 = FactoryGirl.create :user
@user2 = FactoryGirl.create :user
@user3 = FactoryGirl.create :user
@user4 = FactoryGirl.create :user
@user5 = FactoryGirl.create :user

@users = FactoryGirl.create_list(:user, 10)

# create photos
@photo1 = FactoryGirl.create :photo, user: @user1, url: 'http://imgur.com/gallery/uVdRb6N'
@photo2 = FactoryGirl.create :photo, user: @user1, url: 'http://imgur.com/gallery/59jMmt0'
@photo3 = FactoryGirl.create :photo, user: @user1, url: 'http://imgur.com/gallery/FhA2wKd'
@photo4 = FactoryGirl.create :photo, user: @user2, url: 'http://imgur.com/gallery/cbxBg'
@photo5 = FactoryGirl.create :photo, user: @user2, url: 'http://imgur.com/gallery/lCxe5mI'
@photo6 = FactoryGirl.create :photo, user: @user3, url: 'http://imgur.com/gallery/uR6pe'
@photo7 = FactoryGirl.create :photo, user: @user3, url: 'http://imgur.com/gallery/1QyvYbd'
@photo8 = FactoryGirl.create :photo, user: @user4, url: 'http://imgur.com/gallery/tHTZ15q'
@photo9 = FactoryGirl.create :photo, user: @user4, url: 'http://imgur.com/gallery/y405w2k'
@photo10 = FactoryGirl.create :photo, user: @user4, url: 'http://imgur.com/gallery/JMsMaty'
@photo11 = FactoryGirl.create :photo, user: @user4, url: 'http://imgur.com/r/funny/V9IMBIr'
@photo12 = FactoryGirl.create :photo, user: @user4, url: 'http://imgur.com/r/funny/f7B9meF'

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
