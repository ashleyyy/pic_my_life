require_relative './../uploaders/pic_uploader'

class Photo < ActiveRecord::Base
  
  belongs_to :user
  has_many :votes, dependent: :destroy, :counter_cache => true
  mount_uploader :file, PicUploader

  validates :user_id, presence: true, numericality: true
  # validates :file, presence:true

end