class Sub < ActiveRecord::Base
  validates :title, :moderator, presence: true

  has_many :posts
  belongs_to :moderator, class_name: :User
end
