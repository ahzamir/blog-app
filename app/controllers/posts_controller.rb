class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:comments).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    if current_user
      @post = current_user.posts.new(params[:id])
      @post.title = params[:title]
      @post.text = params[:text]
      if @post.save
        redirect_to user_posts_path, notice: 'Post was successfully created. ✅👍'
      else
        render :new
      end
    else
      redirect_to new_user_session_path, notice: 'You need to sign in or sign up before continuing. 🙄'
    end
  end

end
