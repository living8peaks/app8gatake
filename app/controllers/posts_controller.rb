class PostsController < ApplicationController
  before_action :login_required, only: %i[create, destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿を作成しました！'
      redirect_to @user
    else
      render 'posts_path'
    end
  end

  def destroy
  
  end

  private

    def post_params
      params.requir(:post).permit(:content)
    end
end
