class API::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show]
   
  def index
    @users = User.all

    if @users.empty?
      render json: { message: 'No users found' }, status: :not_found
    else
      render json: @users
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    if @posts.empty?
      render json: { message: 'No posts found' }, status: :not_found
    else
      render json: @posts
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
