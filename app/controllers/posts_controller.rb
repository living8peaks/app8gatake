class PostsController < ApplicationController
  before_action :login_required, only: %i[index create, destroy]

  def index
    @post = current_user.posts.build
    @feed_items = current_user.feed.page(params[:page]).per(5)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿を作成しました！'
      redirect_to user_path(current_user)
    else
      render 'index'
    end
  end

  def destroy
  
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
