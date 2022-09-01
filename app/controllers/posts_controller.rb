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
  end

  def create
    @post = Post.new(title: params[:title], text: params[:post][:text], author_id: current_user.id)
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      render :new
    end
  end
end
