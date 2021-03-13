class PostsController < ApplicationController
  before_action :login_required, only: %i[index show create destroy]
  before_action :correct_user, only: :destroy

  def index
    @post = current_user.posts.build
    @feed_items = current_user.feed.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿を作成しました！'
      redirect_to user_path(current_user)
    else
      @feed_items = current_user.feed.page(params[:page]).per(10)
      render 'index'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '投稿を削除しました'
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
