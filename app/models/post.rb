# Post model
class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  after_save :update_posts_counter

  def self.last_five_comments(post_id)
    find_by(id: post_id).comments.limit(5).order(created_at: :desc)
  end

  private

  def update_posts_counter
    user.increment!(:postsCounter)
  end
end
