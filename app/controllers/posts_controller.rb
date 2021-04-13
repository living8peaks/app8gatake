class PostsController < ApplicationController
  before_action :login_required, only: %i[index show create destroy]
  before_action :correct_user, only: :destroy

  def index
    @post = current_user.posts.build
    @posts = Post.page(params[:page]).per(15)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @comments = Comment.all
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.articles_image.attach(params[:post][:articles_image])
    if @post.save
      flash[:success] = '投稿を作成しました！'
      redirect_to root_path
    else
      # @feed_items = current_user.feed.page(params[:page]).per(10)
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
      params.require(:post).permit(:content, :articles_image)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
