# Post model
class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  def update_posts_counter
    User.find_by(id: user_id).increment(:postsCounter).save
  end

  def self.last_five_comments(post_id)
    find_by(id: post_id).comments.limit(5).order(created_at: :desc)
  end
end
