class User < ActiveRecord::Base

  has_many :votes
  has_many :photos

  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validates :username, presence: true, uniqueness: true
  
end