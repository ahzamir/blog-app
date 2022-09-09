class API::V1::PostsController < ApplicationController
  before_action :authorize_request
  before_action :set_post, only: %i[show]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts

    if @posts.empty?
      render json: { message: 'No posts found' }, status: :not_found
    else
      render json: @posts
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments

    if @comments.empty?
      render json: { message: 'No comments found' }, status: :not_found
    else
      render json: @comments
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
