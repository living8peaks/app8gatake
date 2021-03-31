class LendFarmlandsController < ApplicationController
  before_action :login_required

  def index
    # @lend_farmland = @current_user.lend_farmland_ids
    @lend_farmlands = LendFarmland.all
    @lend_farmlands = LendFarmland.page(params[:page]).per(5)
  end

  def show
  end

  def new
    @lend_farmland = LendFarmland.new
  end

  def create
    @lend_farmland = current_user.lend_farmlands.build(lend_farmland_params)
    @lend_farmland.farm_image.attach(params[:lend_farmland][:farm_image])
    if @lend_farmland.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  private

    def lend_farmland_params
      params.require(:lend_farmland).permit(
        :lend_philosophy,
        :lend_municipality,
        :lend_chino,
        :lend_hara,
        :lend_fujimi,
        :lend_area,
        :lend_field_type,
        :immediate_lending,
        :status,
        :watering,
        :sunlight,
        :agricultural_machine,
        :crop,
        :field_situation,
        :lending_period,
        :lending_term,
        :farm_images
      )
    end
end
