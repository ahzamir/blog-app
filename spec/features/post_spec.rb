require 'rails_helper'

RSpec.feature "Posts", type: :feature do
    before(:all) do
        @first_user = User.create(name: 'Integration test', photo: 'http://twitter.com', bio: 'test for User')
        @post1 = Post.create(title: 'Rspec test 1', text: 'rspec test for post', author_id: @first_user.id)
        @post2 = Post.create(title: 'Rspec test 2', text: 'rspec test for post', author_id: @first_user.id)
        @post3 = Post.create(title: 'Rspec test 3', text: 'rspec test for post', author_id: @first_user.id)
        @post4 = Post.create(title: 'Rspec test 4', text: 'rspec test for post', author_id: @first_user.id)
    end
    
end