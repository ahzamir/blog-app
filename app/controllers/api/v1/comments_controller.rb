class API::V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @comments = Comment.all
    if @comments.present?
      response = { status: 'Success', message: 'Comments found', data: @comments }
      render json: response, status: :ok
    else
      render json: { error: 'No comments found' }, status: :not_found
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      response = { status: 'Success', message: 'Comment created', data: comment }
      render json: response, status: :created
    else
      render json: { error: 'Comment not created' }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
