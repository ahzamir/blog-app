class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def five_most_recent_comments
    commentes.includes(:post).order(created_at: :desc).limit(5)
  end
end
