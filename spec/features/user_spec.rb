require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before(:all) do
    @first_user = User.create(name: 'Integration test', photo: 'http://twitter.com', bio: 'test for User')
    @post1 = Post.create(title: 'Rspec test 1', text: 'rspec test for post', author_id: @first_user.id)
    @post2 = Post.create(title: 'Rspec test 2', text: 'rspec test for post', author_id: @first_user.id)
    @post3 = Post.create(title: 'Rspec test 3', text: 'rspec test for post', author_id: @first_user.id)
    @post4 = Post.create(title: 'Rspec test 4', text: 'rspec test for post', author_id: @first_user.id)
  end

  describe 'User index page test' do
    scenario 'Should show the username ' do
      visit users_path
      expect(page).to have_content(@first_user.name)
    end

    scenario 'Should show the profile picture' do
      visit users_path
      expect(page).to have_selector("img[src='#{@first_user.photo}']")
    end

    scenario 'Should show the Number of posts' do
      visit users_path
      expect(page).to have_text('Number of posts: 4')
    end

    scenario 'should redirect to user\'s page' do
      @second_user = User.create(name: 'Messi', photo: 'http://google.com', bio: 'test for redirecting')
      visit users_path
      click_on @second_user.name
      expect(page).to have_current_path(user_path(@second_user))
    end
  end

  describe 'User show page test' do
    scenario 'Should show the username ' do
      visit user_path(@first_user)
      expect(page).to have_content(@first_user.name)
    end

    scenario 'Should show the profile picture' do
      visit user_path(@first_user)
      expect(page).to have_selector("img[src='#{@first_user.photo}']")
    end

    scenario 'Should show the bio' do
      visit user_path(@first_user)
      expect(page).to have_content(@first_user.bio)
    end

    scenario 'Should show the list of three most recent posts' do
      visit user_path(@first_user)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
      expect(page).to have_content(@post4.title)
    end

    scenario 'should redirect to post\'s page' do
      visit user_path(@first_user)
      click_on @post2.title
      expect(page).to have_current_path(user_post_path(@first_user, @post2))
    end
  end

  
end
