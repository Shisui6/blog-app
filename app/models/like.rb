# Like model
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter
    Post.find_by(id: post_id).increment(:likesCounter).save
  end
end
