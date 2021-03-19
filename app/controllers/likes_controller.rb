class LikesController < ApplicationController
  before_action :login_required
  before_action :set_post

  def create
    @like = current_user.like.build(like_params)
    if @like.save
      respond_to :js
    end
  end

  def destroy
    @like = Like.find_by(id: params[id])
    if @like.destroy
      respond_to :js
    end
  end

  private

    def like_params
      params.permit(:post_id)
    end

    def set_post
      @post = @like.post
    end
end
