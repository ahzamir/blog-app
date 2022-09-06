require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) do
    @first_user = User.create(name: 'Integration test', photo: 'http://twitter.com', bio: 'test for User')
    @post1 = Post.create(title: 'Rspec test 1', text: 'rspec test for post', author_id: @first_user.id)
    @post2 = Post.create(title: 'Rspec test 2', text: 'rspec test for post', author_id: @first_user.id)
    @post3 = Post.create(title: 'Rspec test 3', text: 'rspec test for post', author_id: @first_user.id)
  end

  describe 'GET /posts' do
    it 'return a success response' do
      get user_posts_path(@first_user.id)
      expect(response).to have_http_status(200)
    end

    it 'render the index template' do
      get user_posts_path(@first_user.id)
      expect(response).to render_template(:index)
    end

    it 'render the list of posts' do
      get user_posts_path(@first_user.id)
      expect(response.body).to include('User Posts')
    end
  end

  describe 'GET /posts/:id' do
    it 'return a success response' do
      get user_post_path(@first_user.id, @post1.id)
      expect(response).to have_http_status(200)
    end

    it 'render the show template' do
      get user_post_path(@first_user.id, @post1.id)
      expect(response).to render_template(:show)
    end

    it 'render the post' do
      get user_post_path(@first_user.id, @post1.id)
      expect(response.body).to include("Post ##{@post1.id} Details")
    end
  end
end
