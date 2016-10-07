class Post < ActiveRecord::Base
  validates :title, :subs, :author, presence: true

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs
  has_many :comments
  belongs_to :author, class_name: :User
end
