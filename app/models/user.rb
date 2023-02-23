# User model
class User < ApplicationRecord
  validates :name, presence: true
  validates :postsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  has_many :comments
  has_many :posts
  has_many :likes

  def self.last_three_posts
    posts.limit(3).order(created_at: :desc)
  end
end
