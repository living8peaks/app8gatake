class LendFarmlandsController < ApplicationController
  before_action :login_required

  def index
  end

  def show
  end

  def new
    @lend_farmland = LendFarmland.new
  end

  def create
    @lend_farmland = current_user.lend_farmlands.build(lend_farmland_params)
    @lend_farmland.farmlands_image.attach(params[:farmland][:farmlands_image])
    if @user.save
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
        :agricultural_machines,
        :crops,
        :field_situation,
        :lending_period,
        :lending_terms,
        :farmlands_image
      )
    end
end
