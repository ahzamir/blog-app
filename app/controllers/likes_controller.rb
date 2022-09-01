class LikesController < ApplicationController
  def create
    @like = Like.new(post_id: params[:post_id], author_id: current_user.id)
    @like.save
    redirect_to "/users/#{current_user.id}/posts"
  end
end
