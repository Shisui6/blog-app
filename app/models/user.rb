# User model
class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def self.last_three_posts(user_id)
    find_by(id: user_id).posts.limit(3).order(created_at: :desc)
  end
end
