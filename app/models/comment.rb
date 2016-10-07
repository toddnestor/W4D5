class Comment < ActiveRecord::Base
  validates :content, :author, :post, presence: true

  belongs_to :post
  belongs_to :author, class_name: :User
  has_many :child_comments, foreign_key: :parent_comment_id, class_name: :Comment
end
