class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def five_most_recent_comments
    comments.includes(:post).order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
