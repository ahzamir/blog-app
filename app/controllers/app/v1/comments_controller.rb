class Api::V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @comments = Comment.find(params[:post_id])

    if @comments.empty?
      render json: { error: 'No comments found' }, status: :not_found
    else
      render json: @comments, status: :ok
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { error: 'Comment not created' }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
