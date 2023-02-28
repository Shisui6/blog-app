# Post model
class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def last_five_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
