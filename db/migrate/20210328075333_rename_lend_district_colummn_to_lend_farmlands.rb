class RenameLendDistrictColummnToLendFarmlands < ActiveRecord::Migration[6.0]
  def change
    rename_column :lend_farmlands, :lend_district, :lend_chino
  end
end
