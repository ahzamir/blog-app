require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.new(name: 'Huseyin', photo: 'google.com', bio: 'I was born in 2055', posts_counter: '0')
    post = Post.create(title: 'TestTitle', text: 'TestText', comments_counter: '0', likes_counter: '0', author: user)
    Comment.create(text: 'First comment', author: user, post: post)
    Comment.create(text: 'Second comment', author: user, post: post)
  end

  it 'should update comments counter' do
    expect(subject.update_comments_counter).to eq true
    expect(subject.post.comments_counter).to eq 2
  end
end
