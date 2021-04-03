class LendFarmlandsController < ApplicationController
  before_action :login_required
  before_action :correct_user, only: :destroy
  before_action :set_lend_farmland, only: %i[show edit update destroy]

  def index
    @lend_farmlands = LendFarmland.page(params[:page]).per(5)
    @chino_lend_farmlands = LendFarmland.where(lend_municipality: '茅野市').page(params[:page]).per(5)
    @hara_index = LendFarmland.where(lend_municipality: '諏訪郡原村').page(params[:page]).per(5)
    @fujimi_index = LendFarmland.where(lend_municipality: '諏訪郡富士見町').page(params[:page]).per(5)
  end

  def show
    @lend_farmland = LendFarmland.find(params[:id])
  end

  def new
    @lend_farmland = LendFarmland.new
  end

  def create
    @lend_farmland = current_user.lend_farmlands.build(lend_farmland_params)
    @lend_farmland.farm_image.attach(params[:lend_farmland][:farm_image])
    if @lend_farmland.save
      flash[:success] = '貸したい農地の情報を登録しました'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @lend_farmland.destroy
    flash[:success] = '貸したい農地の情報を削除しました'
    redirect_to request.referrer || root_url
  end

  def lend_chino_index
    @chino_farms_items = user.lend_chino.page(params[:page]).per(5)
  end

  def lend_hara_index
    @lend_farmland_hara = LendFarmland.find_by(lend_municipality: '諏訪郡原村')
  end

  def lend_fujimi_index
    @lend_farmland_fujimi = LendFarmland.find_by(lend_municipality: '諏訪郡富士見町')
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

    def correct_user
      @lend_farmland = current_user.lend_farmlands.find_by(id: params[:id])
      redirect_to rooit_url if @lend_farmland.nil?
    end

    def set_lend_farmland
      @lend_farmland = LendFarmland.find(params[:id])
    end
end
