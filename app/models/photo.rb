require_relative './../uploaders/pic_uploader'

class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_one :picture
  mount_uploader :file, PicUploader

  validates :user_id, presence: true, numericality: true
  # validate :url_must_be_valid

  def url_must_be_valid
    errors.add(:url, "The URL must link to a picture(jpg, jpeg, gif or png)") unless url =~ "/(http(s?):)|([/|.|\w|\s])*.(?:jpg|jpeg|gif|png)/"
  end


end