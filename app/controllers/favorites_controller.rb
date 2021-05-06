class FavoritesController < ApplicationController
  before_action :login_required
  before_action :set_lend_farmland

  def create
    @favorite = current_user.favorites.build(favorite_params)
    if @favorite.save
      current_user.favorites.update_all(curious: true)
    end
    @favorites = Favorite.where(lend_farmland_id: @lend_farmland.id)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, lend_farmland_id: @lend_farmland.id)
    @favorite.destroy
    @favorites = Favorite.where(lend_farmland_id: @lend_farmland.id)
  end

  private

    def favorite_params
      params.permit(:lend_farmland_id, :user_id)
    end

    def set_lend_farmland
      @lend_farmland = LendFarmland.find(params[:lend_farmland_id])
    end
end
