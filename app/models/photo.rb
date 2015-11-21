require_relative './../uploaders/pic_uploader'

class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_one :picture
  mount_uploader :file, PicUploader

  validates :user_id, presence: true, numericality: true
  validates :file, presence:true
end