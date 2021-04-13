class AddLendDistrictToLendFarmlands < ActiveRecord::Migration[6.0]
  def change
    add_column :lend_farmlands, :lend_district, :integer
  end
end
