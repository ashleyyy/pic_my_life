class Photo < ActiveRecord::Base

  belongs_to :user
  has_many :votes

  validates :user_id, presence: true, numericality: true
  validates :url, presence: true
  # validate :url_must_be_valid

  def url_must_be_valid
    errors.add(:url, "The URL must link to a picture(jpg, jpeg, gif or png)") unless url =~ "/(http(s?):)|([/|.|\w|\s])*.(?:jpg|jpeg|gif|png)/"
  end


end