class LikesController < ApplicationController
  before_action :login_required
  before_action :set_likable

  def create
    @like = @likable.likes.build(like_params.merge(user: current_user))
    @post = @like.likable.post
    if @like.save
      post = Post.find(params[:post_id])
      post.create_notification_like(current_user)
      respond_to :js
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    #@post = @like.post
    @post = @like.likable.post
    if @like.destroy
      respond_to :js
    end
  end

  private

    def like_params
      params.permit(:likable_type, :likable_id)
      #likable_type likable_idを入れる
    end

    def set_likable
      resource, id = request.path.split('/')[1,2]
      @likable = resource.singularize.classify.constantize.find(id)
    end
end
