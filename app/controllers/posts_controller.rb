class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @post = Post.new(post_params)
    @user = User.find(params[:user_id])
    @post.user = @user
    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end
end
