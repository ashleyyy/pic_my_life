class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :photo, :counter_cache => true

  validates :user_id, numericality: true
  validates :photo_id, numericality: true

  validate :user_can_only_vote_once, on: :create
  validate :context_must_be_valid, on: :create

  private 

  def context_must_be_valid
    unless (context == "funny" || context == "shameful")
      errors.add(:context, "must be either funny or shameful")
    end
  end

  def user_can_only_vote_once
    vote = photo.votes.find_by(user_id: user.id, context: context)
    errors.add(:vote, "cannot vote twice for the same option") if vote
  end

end