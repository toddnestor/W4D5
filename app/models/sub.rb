class Sub < ActiveRecord::Base
  validates :title, :moderator, presence: true

  has_many :post_subs, dependent: :destroy
  has_many :posts, through: :post_subs
  belongs_to :moderator, class_name: :User
end
