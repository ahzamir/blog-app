require 'rails_helper'

RSpec.describe 'Users', type: :request do
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
            get ('/users/1')
            expect(response).to have_http_status(200)
        end

        it 'renders the show template' do
            get ('/users/1')
            expect(response).to render_template('show')
        end

        it 'renders the user' do
            get ('/users/1')
            expect(response.body).to include('User Profile')
        end
    end
end