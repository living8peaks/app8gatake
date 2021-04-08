class RentFarmlandsController < ApplicationController
  before_action :login_required
  before_action :correct_user, only: :destroy
  before_action :set_rent_farmland, only: %i[show edit update destroy]

  def index
    @rent_farmlands = RentFarmland.page(params[:page]).per(5)
    @chino_rent_index = RentFarmland.where(rent_municipality: '茅野市').page(params[:page]).per(5)
    @hara__rent_index = RentFarmland.where(rent_municipality: '諏訪郡原村').page(params[:page]).per(5)
    @fujimi_index = RentFarmland.where(rent_municipality: '諏訪郡富士見町').page(params[:page]).per(5)
  end

  def show
  end

  def new
    @rent_farmland = RentFarmland.new
  end

  def create
    @rent_farmland = current_user.rent_farmlands.build(rent_farmland_params)
    if @rent_farmland.save
      flash[:success] = '借りたい農地の情報を登録しました'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @rent_farmland.update(rent_farmland_params)
      flash[:success] = '借りたい農地の情報を編集しました'
      redirect_to lend_farmlands_path
    else
      render 'edit'
    end
  end

  def destroy
    @rent_farmland.destroy
    flash[:success] = '借りたい農地の情報を削除しました'
    redirect_to request.referrer || root_url
  end

  private

    def rent_farmlands_params
      params.require(:rent_farmland).permit(
        :rent_philosophy,
        :rent_municipality,
        :rent_chino,
        :rent_hara,
        :rent_fujimi,
        :rent_area,
        :rent_field_type,
        :rent_desired_year,
        :borrow_immediately,
        :renting_term,
        :rent_other_term,
      )
    end

    def correct_user
      @rent_farmland = current_user.rent_farmlands.find_by(id: params[:id])
      redirect_to rooit_url if @rent_farmland.nil?
    end

    def set_rent_farmland
      @rent_farmland = RentFarmland.find(params[:id])
    end
end
