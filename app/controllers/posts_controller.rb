class PostsController < ApplicationController
  before_action :login_required, only: %i[index create, destroy]

  def index
    @post = current_user.posts.build if logged_in?
    @posts = Post.page(params[:page]).per(20)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿を作成しました！'
      redirect_to user_path(current_user)
    else
      render 'posts_path'
    end
  end

  def destroy
  
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
