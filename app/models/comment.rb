class Comment < ActiveRecord::Base
  validates :content, :author, :post, presence: true

  belongs_to :post
  belongs_to :author, class_name: :User
  has_many :child_comments, foreign_key: :parent_comment_id, class_name: :Comment
  include Votable

  def comments_by_parent_id
    comments = Hash.new {Array.new}

    self.child_comments.includes(:author).each do |comment|
      comments[comment.parent_comment_id] += [comment]
    end

    comments
  end
end
