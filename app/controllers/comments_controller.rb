class CommentsController < ApplicationController
    def new
        @comment = Comment.new
        @post = Post.find(params[:post_id])
        @user = User.find(params[:user_id])
    end
end