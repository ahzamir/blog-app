require 'rails_helper'

RSpec.describe "Posts", type: :request do
    describe "GET /posts" do
        it "return a success response" do
            get ('/users/1/posts')
            expect(response).to have_http_status(200)
        end
    end
end