class StaticPagesController < ApplicationController
  def top
    if logged_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.page(params[:page]).per(10)
    end
  end

  def about
  end

  def contact
  end

  def privacy_policy
  end

  def terms_of_service
  end
end
