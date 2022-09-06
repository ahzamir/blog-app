require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    @first_user = User.create(name: 'Integration test', photo: 'http://twitter.com', bio: 'test for User')
    @post1 = Post.create(title: 'Rspec test 1', text: 'rspec test for post', author_id: @first_user.id)
    @post2 = Post.create(title: 'Rspec test 2', text: 'rspec test for post', author_id: @first_user.id)
    @post3 = Post.create(title: 'Rspec test 3', text: 'rspec test for post', author_id: @first_user.id)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'renders the list of users' do
      get users_path
      expect(response.body).to include('Users List')
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get("/users/#{@first_user.id}")
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get("/users/#{@first_user.id}")
      expect(response).to render_template('show')
    end

    it 'renders the user' do
      get("/users/#{@first_user.id}")
      expect(response.body).to include('User Profile')
    end
  end
end
