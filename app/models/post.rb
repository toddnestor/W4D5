class Post < ActiveRecord::Base
  validates :title, :subs, :author, presence: true

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs
  has_many :comments
  belongs_to :author, class_name: :User
  include Votable

  def comments_by_parent_id
    comments = Hash.new {Array.new}

    self.comments_by_vote.includes(:author).each do |comment|
      comments[comment.parent_comment_id] += [comment]
    end

    comments
  end

  def comments_by_vote
    self.comments
      .joins("LEFT JOIN votes ON votes.votable_id = comments.id AND votes.votable_type = 'Comment'")
      .group("comments.id")
      .order("COALESCE(SUM(votes.value), 0) DESC")
  end
end
