require 'rails_helper'

RSpec.feature "Posts", type: :feature do
    before(:all) do
        @first_user = User.create(name: 'Integration test', photo: 'http://twitter.com', bio: 'test for User')
        @post1 = Post.create(title: 'Rspec test 1', text: 'rspec test for post', author_id: @first_user.id)
        @post2 = Post.create(title: 'Rspec test 2', text: 'rspec test for post', author_id: @first_user.id)
        @post3 = Post.create(title: 'Rspec test 3', text: 'rspec test for post', author_id: @first_user.id)
    end
    
    describe 'Post index page test' do
        scenario 'Should show the title ' do
        visit "/users/#{@first_user.id}/posts"
        expect(page).to have_content(@post1.title)
        end
    
        scenario 'Should show the text' do
        visit "/users/#{@first_user.id}/posts"
        expect(page).to have_content(@post1.text)
        end
    
        scenario 'Should show the author' do
        visit "/users/#{@first_user.id}/posts"
        expect(page).to have_content(@first_user.name)
        end
    
        scenario 'should redirect to post\'s page' do
        visit "/users/#{@first_user.id}"
        click_on @post1.title
        expect(page).to have_current_path("/users/#{@first_user.id}/posts/#{@post1.id}")
        end
    end

    describe 'Post show page test' do
        scenario 'Should show the title ' do
        visit "users/#{@first_user.id}/posts/#{@post1.id}"
        expect(page).to have_content(@post1.title)
        end
    
        scenario 'Should show the text' do
        visit "users/#{@first_user.id}/posts/#{@post1.id}"
        expect(page).to have_content(@post1.text)
        end
    
        scenario 'Should show the author' do
        visit "users/#{@first_user.id}/posts/#{@post1.id}"
        expect(page).to have_content(@first_user.name)
        end
    end

end