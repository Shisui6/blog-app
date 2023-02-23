# User model
class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def self.last_three_posts
    posts.limit(3).order(created_at: :desc)
  end
end
