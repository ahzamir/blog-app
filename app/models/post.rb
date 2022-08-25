class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def update_posts_count
    author.update(posts_counter: author.posts.count)
  end
end
