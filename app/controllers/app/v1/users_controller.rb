class Api::V1::UsersController < ApplicationController
  before_action :authorize_request

  def index
    @users = Users.all

    if @users.empty?
      render json: { error: 'No users found' }, status: :not_found
    else
      render json: @users, status: :ok
    end
  end

  def show
    @posts = @user.posts
  end

  def set_user
    @user = User.find(params[:id])
  end
end
