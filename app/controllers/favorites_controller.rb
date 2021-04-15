class FavoritesController < ApplicationController
  before_action :login_required
  before_action :set_favorite

  def create
    @favorite = current_user.favorites.build(favorite_params)
    if @favorite.save
      respond_to :js
    end
  end

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    if @favorite.destroy
      respond_to :js
    end
  end

  private

    def favorite_params
      params.permit(:lend_farmland_id)
    end

    def set_favorite
      @lend_farmland = @favorite.lend_farmland
    end
end
