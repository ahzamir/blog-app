class PostsController < ApplicationController
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token
  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments, :likes).find(params[:id])
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

  def destroy
    selected_post = Post.find(params[:id])
    user = User.find(selected_post.author_id)
    if selected_post.comments.any?
      selected_post.comments.destroy_all
    end
    selected_post.destroy
    if user.save
      redirect_to user_posts_path, notice: 'Post was successfully deleted. ✅👍'
    else
      render :new, alert: 'An error has occurred while deleting the post'
    end
  end
end
