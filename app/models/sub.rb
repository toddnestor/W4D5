class Sub < ActiveRecord::Base
  validates :title, :moderator, presence: true

  has_many :post_subs, dependent: :destroy
  has_many :posts, through: :post_subs
  belongs_to :moderator, class_name: :User

  paginates_per 50

  extend FriendlyId
  friendly_id :title, use: :slugged

  def posts_by_vote
    self.posts
      .joins("LEFT JOIN votes ON votes.votable_id = posts.id AND votes.votable_type = 'Post'")
      .group("posts.id")
      .order("COALESCE(SUM(votes.value), 0) DESC")
  end

end
