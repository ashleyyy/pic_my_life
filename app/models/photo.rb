class Photo < ActiveRecord::Base

  belongs_to :user
  has_many :votes

  validates :user_id, presence: true, numericality: true
  validates :url, presence: true

end