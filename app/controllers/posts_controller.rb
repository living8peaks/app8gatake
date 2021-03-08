class PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(20)
  end

  def show
  
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to 'root_path'
    else
      render 'posts_path'
    end
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
