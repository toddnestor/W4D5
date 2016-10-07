module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  def receive_vote(user, value)
    vote = self.votes.find_by_user_id(user.id)
    vote ||= Vote.new(user_id: user.id)
    vote.value = value
    vote.save
    self.votes << vote
  end
end
