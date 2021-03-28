class LendFarmlandsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @lend_farnland = current_user.lend_farnlands.build(lend_farnland_params)
  end

  def create
    
  end

  def edit
  end

  private

    def lend_farnland_params
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
      )
    end
end
