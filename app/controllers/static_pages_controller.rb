class StaticPagesController < ApplicationController
  def top
    if logged_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.page(params[:feed_page]).per(10)
      @notifications = current_user.passive_notifications.page(params[:page]).per(5)
      favorites = Favorite.where(user_id: current_user.id).pluck(:lend_farmland_id)
      @favorite_list = LendFarmland.find(favorites)
      #@favorite_items = Kaminari.paginate_array(@favorite_list).page(params[:favorite_page]).per(1)
      gon.lend_farmlands = LendFarmland.all
      gon.favorite_list = LendFarmland.find(favorites)
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
