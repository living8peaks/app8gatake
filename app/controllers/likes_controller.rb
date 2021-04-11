class LikesController < ApplicationController
  before_action :login_required

  def create
    @like = current_user.likes.build(like_params)
    @post = @like.post
    @lend_farmland = @like.lend_farmland
    if @like.save
      post = Post.find(params[:post_id])
      @lend_farmland = LendFarmland.find(params[:lend_farmland_id])
      post.create_notification_like(current_user)
      respond_to :js
    end
  end

  def destroy
  @like = Like.find_by(id: params[:id])
  @post = @like.post
  @lend_farmland = @like.lend_farmland
    if @like.destroy
      respond_to :js
    end
  end

  private
    def like_params
      params.permit(:post_id)
    end
end
