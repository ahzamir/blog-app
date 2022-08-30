require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'return a success response' do
      get('/users/1/posts')
      expect(response).to have_http_status(200)
    end

    it 'render the index template' do
      get('/users/1/posts')
      expect(response).to render_template(:index)
    end

    it 'render the list of posts' do
      get('/users/1/posts')
      expect(response.body).to include('User 1 Posts List')
    end
  end

  describe 'GET /posts/:id' do
    it 'return a success response' do
      get('/users/1/posts/1')
      expect(response).to have_http_status(200)
    end

    it 'render the show template' do
      get('/users/1/posts/1')
      expect(response).to render_template(:show)
    end

    it 'render the post' do
      get('/users/1/posts/1')
      expect(response.body).to include('Post 1 Details')
    end
  end
end
