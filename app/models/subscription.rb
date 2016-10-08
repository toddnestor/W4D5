class Subscription < ActiveRecord::Base
  validates :user, :sub, presence: true

  belongs_to :sub
  belongs_to :user
end
