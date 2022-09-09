class Api::PostsController < ApplicationController
    before_action :authorize_request

    def index
        @posts = Post.where(user_id: params[:user_id])

        if @posts.empty?
            render json: { error: "No posts found" }, status: :not_found
        else
            render json: @posts, status: :ok
        end
    end
end