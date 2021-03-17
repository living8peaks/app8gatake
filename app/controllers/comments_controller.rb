class CommentsController < ApplicationController
  before_action :login_required, only: %i[create destroy]
  before_action :set_post, only: %i[create destroy]

  def create
    @comment = Post.find(params[:post_id]).comments.new(comment_params)
    @comment.remark_image.attach(params[:comment][:remark_image])
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private

    def comment_params
      params.require(:comment).permit(
        :remark,
        :remark_image,
        :user_id).merge(post_id: params[:post_id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
