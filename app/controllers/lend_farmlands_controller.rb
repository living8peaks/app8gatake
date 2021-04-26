class LendFarmlandsController < ApplicationController
  before_action :login_required
  before_action :correct_user, only: :destroy
  before_action :set_lend_farmland, only: %i[show edit update destroy search]

  def index
    gon.lend_farmlands = LendFarmland.all
    @q = LendFarmland.ransack(params[:q])
    @lend_farmlands = @q.result.page(params[:page]).per(5)
    @chino_index = LendFarmland.where(lend_municipality: '茅野市').page(params[:page]).per(5)
    @hara_index = LendFarmland.where(lend_municipality: '諏訪郡原村').page(params[:page]).per(5)
    @fujimi_index = LendFarmland.where(lend_municipality: '諏訪郡富士見町').page(params[:page]).per(5)
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
      flash[:success] = '貸したい農地の情報を登録しました'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @lend_farmland.farm_image.attach(params[:lend_farmland][:farm_image])
    if @lend_farmland.update(lend_farmland_params)
      flash[:success] = '貸したい農地の情報を編集しました'
      redirect_to lend_farmlands_path
    else
      render 'edit'
    end
  end

  def destroy
    @lend_farmland.destroy
    flash[:success] = '貸したい農地の情報を削除しました'
    redirect_to request.referrer || root_url
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
        :lend_other_term,
        :farm_images,
        :address,
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
