class Api::CommentsController < ApplicationController
  before_action :authorize_request
  protect_from_forgery with: :null_session

  def index
    @comments = Comment.where(post_id: params[:post_id])

    if @comments.empty?
      render json: { error: 'No comments found' }, status: :not_found
    else
      render json: @comments, status: :ok
    end
  end

  def create
    @comment = Comment.new(text: params[:text], user_id: @decoded['id'], post_id: params[:post_id])

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { error: 'Comment not created' }, status: :unprocessable_entity
    end
  end
end
