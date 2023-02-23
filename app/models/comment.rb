# Comment model
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter
    Post.find_by(id: post_id).increment(:commentsCounter).save
  end
end
